import 'dart:async';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:http/http.dart' as http;
import 'package:regardless_data_module/app/utils/url.dart';

export '../../../domain/model/media_upload/direct_media_upload_finalize_payload.dart';
export '../../../domain/model/media_upload/direct_media_upload_init.dart';

class DirectUploadHandle {
  final void Function() cancel;
  final Future<void> done;

  DirectUploadHandle({required this.cancel, required this.done});
}

class DirectMediaUploadService {
  const DirectMediaUploadService();

  DirectUploadHandle uploadBytesWithProgress(
      {required String signedUrl,
      required XFile file,
      required String contentType,
      required void Function(double progress) onProgress}) {
    bool cancelled = false;

    Future<void> run() async {
      final uri = Uri.parse(
          signedUrl.replaceFirst('127.0.0.1', Url.firebaseEmulatorHost));

      final request = http.StreamedRequest('PUT', uri);
      request.headers['Content-Type'] = contentType; // Adjust content type

      // Add bytes to the stream with progress tracking
      int bytesUploaded = 0;
      final data = await file.readAsBytes();
      int totalBytes = data.length;
      final Stream<List<int>> byteStream =
          _openRead(file).transform(_progressTransformer(
        totalBytes: totalBytes,
        onProgress: onProgress,
      ));

      byteStream.listen(
        (bytes) {

          request.sink.add(bytes);
          bytesUploaded += bytes.length;
          final p = (bytesUploaded / totalBytes).clamp(0.0, 1.0);
          onProgress.call(p);
        },
        onDone: () {
          request.sink.close();
        },
        onError: (error) {
          request.sink.close();
        },
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        if (!cancelled) {
          onProgress.call(1.0);
        }
      }
    }

    final done = run();
    return DirectUploadHandle(
      cancel: () {
        cancelled = true;
      },
      done: done,
    );
  }

  DirectUploadHandle startUploadToSignedUrl({
    required String signedUrl,
    required XFile file,
    required String contentType,
    required void Function(double progress) onProgress,
  }) {
    final client = http.Client();
    bool cancelled = false;

    Future<void> run() async {
       final uri = Uri.parse(signedUrl);
      final length = await _fileLength(file);
      final stream = _openRead(file).transform(_progressTransformer(
        totalBytes: length,
        onProgress: onProgress,
      ));
 
      final req = http.StreamedRequest('PUT', uri);
      req.headers['Content-Type'] = contentType;
      req.contentLength = length;
 
      // // Add the stream to the request
      // stream.listen(
      //   (bytes) {
      //     req.sink.add(bytes);
      //   },
      //   onDone: () {
      //     req.sink.close();
      //   },
      //   onError: (error) {
      //     print('Stream error: $error');
      //     req.sink.close();
      //   },
      //   cancelOnError: true,
      // );

      try {
        await req.sink.addStream(stream);

 
        final res = await client.send(req);
 
        if (res.statusCode < 200 || res.statusCode >= 300) {
          final body = await res.stream.bytesToString();
          throw Exception('PUT to signedUrl failed (${res.statusCode}): $body');
        }
        await req.sink.close();
        if (!cancelled) onProgress(1.0);
      } finally {
        client.close();
      }
    }

    final done = run();
    return DirectUploadHandle(
      cancel: () {
        cancelled = true;
        client.close();
      },
      done: done,
    );
  }

  StreamTransformer<List<int>, List<int>> _progressTransformer({
    required int totalBytes,
    required void Function(double progress) onProgress,
  }) {
    int sent = 0;
    return StreamTransformer.fromHandlers(
      handleData: (chunk, sink) {
        sent += chunk.length;
        if (totalBytes > 0) {
          final p = sent / totalBytes;
          onProgress(p.clamp(0.0, 1.0));
        }
        sink.add(chunk);
      },
    );
  }

  Stream<List<int>> _openRead(XFile file) {
    if (file.path.isNotEmpty) {
      return File(file.path).openRead();
    }
    return file.openRead();
  }

  Future<int> _fileLength(XFile file) async {
    if (file.path.isNotEmpty) {
      return await File(file.path).length();
    }
    final bytes = await file.readAsBytes();
    return bytes.length;
  }
}

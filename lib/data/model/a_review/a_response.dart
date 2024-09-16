import 'dart:convert';

import '../../../domain/domain_mapper.dart';
import '../../../domain/model/review/response.dart';

class AResponse implements DomainMapper<Response> {
  final String? responder;
  final String? comment;
  final String? date;

  const AResponse({this.responder, this.comment, this.date});

  @override
  String toString() {
    return 'Response(responder: $responder, comment: $comment, date: $date)';
  }

  factory AResponse.fromMap(Map<String, dynamic> data) => AResponse(
        responder: data['responder'] as String?,
        comment: data['comment'] as String?,
        date: data['date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'responder': responder,
        'comment': comment,
        'date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Response].
  factory AResponse.fromJson(String data) {
    return AResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Response] to a JSON string.
  String toJson() => json.encode(toMap());

  AResponse copyWith({
    String? responder,
    String? comment,
    String? date,
  }) {
    return AResponse(
      responder: responder ?? this.responder,
      comment: comment ?? this.comment,
      date: date ?? this.date,
    );
  }

  @override
  Response mapToDomain() {
    return Response(
      responder: responder ?? '',
      comment: comment ?? '',
      date: date ?? '',
    );
  }
}

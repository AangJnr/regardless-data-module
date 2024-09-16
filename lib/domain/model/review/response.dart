class Response {
  final String responder;
  final String comment;
  final String date;

  const Response({this.responder = '', this.comment = '', this.date = ''});

  @override
  String toString() {
    return 'Response(responder: $responder, comment: $comment, date: $date)';
  }

  Response copyWith({
    String? responder,
    String? comment,
    String? date,
  }) {
    return Response(
      responder: responder ?? this.responder,
      comment: comment ?? this.comment,
      date: date ?? this.date,
    );
  }
}

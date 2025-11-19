class PaginatedResponse<T, S> {
  final int? limit;
  final List<Map<String, dynamic>>? data;
  final dynamic last;
  final bool? next;

  const PaginatedResponse({
    this.limit,
    this.data,
    this.next,
    this.last,
  });

  factory PaginatedResponse.fromMap(dynamic data, {String label = 'results'}) {
    data as Map<String, dynamic>;
    return PaginatedResponse(
      limit: data['limit'] as int?,
      data: (data[label] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      next: data['next'] as bool?,
      last: data['last'] as dynamic,
    );
  }

  bool get hasNext => next ?? true;
}

class PaginationRequest {
  final int limit;
  final dynamic last;
  final String? query;
  const PaginationRequest({
    this.limit = 20,
    this.last,
    this.query,
  });

  String toQueryParams({String additionalData = ''}) =>
      '?limit=$limit&last=$last$additionalData${query != null ? '&query=$query' : ''}';
}

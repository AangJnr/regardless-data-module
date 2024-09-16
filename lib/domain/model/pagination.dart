class Pagination<E> {
  final List<E> data;
  final bool hasNext;
  final dynamic last;

  const Pagination({this.data = const [], this.hasNext = true, this.last});

  Pagination<E> copyWith({List<E>? data, dynamic last, bool? hasNext}) =>
      Pagination(
          data: data ?? this.data,
          last: last ?? this.last,
          hasNext: hasNext ?? this.hasNext);
}

import '../../domain/model/venue.dart';

class SearchFilter {
  String? startDate;
  int page;
  int pageSize;
  String query;
  SearchFilter(
      {this.startDate, this.page = 1, this.pageSize = 25, this.query = ''});

  Map<String, dynamic> toMap() {
    final filterMap = {"page": "$page", "pageSize": pageSize, "query": query};
    if (startDate?.isNotEmpty == true) {
      filterMap.putIfAbsent("startDate", () => "$startDate");
    }
    return filterMap;
  }
}

class SearchEventParams {
  DateTime? startDate;
  DateTime? endDate;
  List<String> categoryUids;
  Venue? location;
  String query;
  num maxDistance;
  SearchEventParams({
    this.startDate,
    this.endDate,
    this.categoryUids = const [],
    this.location,
    this.query = "",
    this.maxDistance = 100,
  });

  Map<String, dynamic> toMap() => {
        "startDate": "${startDate?.millisecondsSinceEpoch}",
        "endDate": "${endDate?.millisecondsSinceEpoch}",
        "categoryUids": categoryUids,
        "lat": location?.lat,
        "lng": location?.lng,
        "query": query,
        "maxDistance": maxDistance
      };
}

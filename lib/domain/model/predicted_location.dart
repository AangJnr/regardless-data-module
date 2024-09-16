class PredictedLocation {
  final String address;
  final bool matches;
  final String placeId;
  final int length;
  final int offset;

  const PredictedLocation(
      {required this.address,
      this.matches = false,
      required this.placeId,
      this.length = 0,
      this.offset = 0});
}

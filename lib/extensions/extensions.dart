
 extension StringExtensions on String {
  String get profileUidToProfileUrl {
    if (isEmpty) return '';
    return 'https://storage.googleapis.com/regardless-social-api.appspot.com%2Fprofile_pictures%2F$this%2F$this.png?alt=media';
  }
}
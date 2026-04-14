extension StringExtensions on String {
  String get profileUidToProfileUrl {
    if (isEmpty) return '';
    return 'https://storage.googleapis.com/regardless-social-api.appspot.com%2Fprofile_pictures%2F$this%2F$this.png?alt=media';
  }

  String guessContentType() {
    final lower = toLowerCase();
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.heic')) return 'image/heic';
    if (lower.endsWith('.mp4')) return 'video/mp4';
    if (lower.endsWith('.mov')) return 'video/quicktime';
    if (lower.endsWith('.m4v')) return 'video/x-m4v';
    if (lower.endsWith('.webm')) return 'video/webm';
    return '';
  }
}

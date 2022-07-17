class Twitter {
  final String captionText;
  final List<String>? hashtags;
  final String? url;
  final String? trailingText;

  Twitter({
    required this.captionText,
    this.hashtags,
    this.url,
    this.trailingText,
  });
}

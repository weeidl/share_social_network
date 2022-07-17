class Facebook {
  final String imagePath;
  final String backgroundTopColor;
  final String backgroundBottomColor;
  final String attributionURL;
  final String? appId;

  Facebook(
      {required this.imagePath,
      required this.attributionURL,
      required this.backgroundBottomColor,
      required this.backgroundTopColor,
      this.appId});
}

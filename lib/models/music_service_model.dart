class MusicServiceModel {
  String title;
  String subtitle;
  String imageUrl;
  String icon;

  MusicServiceModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.icon,
  });

  MusicServiceModel.fromJson(Map<String, dynamic> json)
      : title = json['title']! as String,
        subtitle = json['subtitle']! as String,
        imageUrl = json['imageUrl']! as String,
        icon = json['icon']! as String;
}
class Post {
  final String title;
  final String description;
  final String domain;
  final List<String> tags;
  final String imageurl;
  final String gitlink;
  final int time;
  final List<Map<String, String>> contact;
  Post(
      {required this.title,
      required this.domain,
      required this.tags,
      required this.description,
      required this.imageurl,
      required this.gitlink,
      required this.time,
      required this.contact});
}

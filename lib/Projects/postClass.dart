class Post {
  final String projectId;
  final String title;
  final String description;
  final List<dynamic> tags;
  final String imageurl;
  final String gitlink;
  final int time;
  final List<dynamic> contact;
  Post(
      {required this.projectId,
      required this.title,
      required this.tags,
      required this.description,
      required this.imageurl,
      required this.gitlink,
      required this.time,
      required this.contact});
}

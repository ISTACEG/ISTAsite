class OfficeBearer {
  int id;
  String name;
  String role;
  String imgurl;
  String contact;
  OfficeBearer(
      {required this.id,
      required this.name,
      required this.role,
      required this.imgurl,
      required this.contact});
}

class Magazine {
  int edition;
  String month, id;
  int year;
  String cover_url;
  String file_url;
  Magazine(
      {required this.id,
      required this.edition,
      required this.month,
      required this.year,
      required this.cover_url,
      required this.file_url});
}

class Company {
  String name;
  String docid;
  String img;
  Company({required this.name, required this.docid, required this.img});
}

class Experience {
  String studentName;
  String rollno;
  String experience;
  int yearOfPassing;
  Experience(
      {required this.studentName,
      required this.rollno,
      required this.experience,
      required this.yearOfPassing});
}

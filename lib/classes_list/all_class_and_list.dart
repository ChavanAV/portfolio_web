
class EduList {
  final String std;
  final String year;
  final String clg;
  EduList({
    required this.std,
    required this.year,
    required this.clg,
});
}
class CertificateList{
  final String description;
  final String title;
  final String imgPath;

  CertificateList( {
    required this.description,
    required this.title,
    required this.imgPath,
  });
}

List<EduList> edInfoList = [
  EduList(
      year: '2021-2022',
      std: "S Y BTech",
      clg: "Sveri's College of Engineering Pandharpur\n"
          "Percentage: 85.05% (SGPA: 9.53)\n"
          "Knowledge Acquired: Programming language Java and Python.",
  ),
  EduList(
      std: "HSC",
      clg: "K.B.P College Pandharpur\n"
          "Percentage: 74.63%\n"
          "Knowledge Acquired: Maths,Physics, and Chemistry.\n"
          "This knowledge helps to understand the basic concepts of engineering field",
      year: '2019-2020',
  ),
  EduList(
      std: "SSC",
      clg: "Bhairavanath Vidyalaya Adhiv,\n"
          "Percentage: 88.40%\n"
          "I was first ranked student in high school.\n"
          "That year was graceful for me.",
      year: '2017-2018',
  ),
];

List<CertificateList> certificateInfoList = [
  CertificateList(
    title: "",
    description: "",
    imgPath: "assets/images/certificates/flutter vt.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/flutter essential.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/flutter beginner.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/flutter essential.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/andriod essential.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/progrmming using java.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/java step by step.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/html.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/matpo apti.png"
  ),
  CertificateList(
      title: "",
      description: "",
      imgPath: "assets/images/certificates/iic impact lect.png"
  ),
];
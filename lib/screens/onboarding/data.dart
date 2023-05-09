import '../../../shared/exports.dart';

class OnBoardData {
  String pngimg;
  String title;
  String desc;
  OnBoardData({required this.pngimg, required this.title, required this.desc});
}

List<OnBoardData> ondata = [
  OnBoardData(
      pngimg: Images.group,
      title: 'Welcome to StudentInfo',
      desc:
          "The ultimate destination for all students informations and create new students."),
  OnBoardData(
      pngimg: Images.study,
      title: 'Anytime, Anywhere',
      desc:
          "Get Student Information anywhere, the name, date of birth, age, and other information"),
  OnBoardData(
      pngimg: Images.online,
      title: 'Ready To Know Yourself',
      desc:
          "StudIngo has an easy-to-use interface that allows users to search for specific students or browse students."),
];

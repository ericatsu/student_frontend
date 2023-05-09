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
          "The ultimate destination for buying and selling digital arts and books."),
  OnBoardData(
      pngimg: Images.study,
      title: 'Anytime, Anywhere',
      desc:
          "The app offers a wide selection of digital arts and books, including paintings, photographs, ebooks,"),
  OnBoardData(
      pngimg: Images.online,
      title: 'Ready To Know Yourself',
      desc:
          "Awstore has an easy-to-use interface that allows users to search for specific items or browse by category."),
];

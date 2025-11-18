class BottomTabModel {
  final String img;
  final String activeImg;
  final String title;
  final bool hasTab;
  bool isSelected;

  BottomTabModel({required this.img, required this.title, this.activeImg = "", this.hasTab = false, this.isSelected = false});
}

class Data {
  final String num;
  final String title;
  final String icon;
  Data({required this.num, required this.title, required this.icon});
}

final List<Data> data = [
  Data(num: '345', title: "Total Menu", icon: "asset/icon/menu.svg"),
  Data(num: '1.250', title: "Total Order", icon: "asset/icon/cart.svg"),
  Data(num: '856', title: "Total Customer", icon: "asset/icon/customer.svg"),
  Data(num: '3,500', title: "Total Revenue", icon: "asset/icon/chart.svg"),
];

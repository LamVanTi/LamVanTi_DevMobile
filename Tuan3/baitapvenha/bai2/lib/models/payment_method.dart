class PaymentMethod {
  final int id;
  final String name;
  final String icon;
  bool isSelected;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    this.isSelected = false,
  });
}

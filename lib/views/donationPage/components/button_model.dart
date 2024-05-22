class ButtonModel {
  final String label;
  final String price;
  ButtonModel({required this.label, required this.price,});
}

List<ButtonModel> buttonList = [
  ButtonModel(label: "Ultrasound", price: "Rs. 3,500"),
  ButtonModel(label: "Mammogram", price: "Rs. 6,000"),
  ButtonModel(label: "Biopsy", price: "Rs. 7,500"),
  ButtonModel(label: "Chemo (1 dose)", price: "Rs. 50,000"),
  ButtonModel(label: "Surgery", price: "Rs. 1,50,000"),
];
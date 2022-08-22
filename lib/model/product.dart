class Product {
  final List<String> image;
  final String name;
  final int amount;
  final String information;
  final List<int> size;
  final int price;
  final int review;

  Product({
    required this.price,
    required this.image,
    required this.name,
    required this.amount,
    required this.information,
    required this.size,
    required this.review,
  });

  @override
  String toString() {
    return 'Product{image: $image, name: $name, amount: $amount, information: $information, size: $size, price: $price}';
  }
}

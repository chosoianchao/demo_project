class CartProduct {
  final String image;
  final String name;
  final int amount;
  final int size;
  final int price;

  CartProduct({
    required this.image,
    required this.name,
    required this.amount,
    required this.size,
    required this.price,
  });

  @override
  String toString() {
    return 'CartProduct{image: $image, name: $name, amount: $amount, size: $size, price: $price}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProduct &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          name == other.name &&
          amount == other.amount &&
          size == other.size &&
          price == other.price;

  @override
  int get hashCode =>
      image.hashCode ^
      name.hashCode ^
      amount.hashCode ^
      size.hashCode ^
      price.hashCode;
}

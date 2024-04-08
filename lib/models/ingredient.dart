class Unit {
  final String name;
  final String abbreviation;

  Unit({required this.name, required this.abbreviation});
}

class Ingredient {
  final String name;
  final String imageUrl;
  final double amount;
  final Unit unit;
  final DateTime expirationDate;
  final String storageLocation;

  Ingredient({
    required this.name,
    required this.imageUrl,
    required this.amount,
    required this.unit,
    required this.expirationDate,
    required this.storageLocation,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Ingredient &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.amount == amount &&
        other.unit == unit;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ amount.hashCode ^ unit.hashCode;
  }
}
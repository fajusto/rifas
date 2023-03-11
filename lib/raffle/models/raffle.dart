class Raffle {
  String? id;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  int? quantity;
  String? price;
  String? createdBy;

  Raffle(
      {this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.quantity,
      this.price,
      this.createdBy});

  Map<String, dynamic> toMap() => {
        'name': name,
        'startDate': startDate,
        'endDate': endDate,
        'quantity': quantity,
        'price': price,
        'createdBy': createdBy,
      };
}

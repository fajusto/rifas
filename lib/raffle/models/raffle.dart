class Raffle {

  String? id;
  String? name;
  DateTime? startDate;
  DateTime? endDate;
  int? quantity;

  Raffle({this.id, this.name, this.startDate, this.endDate, this.quantity});

  Map<String, dynamic> toMap () => {
    'name' : name,
    'startDate' : startDate,
    'endDate' : endDate,
    'quantity' : quantity,
  };
}
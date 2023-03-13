class RaffleNumber {

  int? number;
  String? status;
  String? soldBy;
  String? name;
  String? address;
  String? phoneNumber;

  RaffleNumber({
    this.number,
    this.status = 'Não vendida',
    this.soldBy,
    this.name,
    this.address,
    this.phoneNumber
  });

  Map<String, dynamic> toMap() => {
    'number': number,
    'status': status,
    'sold_by': soldBy,
    'name': name,
    'address': address,
    'phone_number': phoneNumber,
  };
}
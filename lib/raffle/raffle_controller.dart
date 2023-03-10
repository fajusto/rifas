import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:rifas/raffle/models/raffle.dart';

part 'raffle_controller.g.dart';

class RaffleController = _RaffleController with _$RaffleController;

abstract class _RaffleController with Store {

  @observable
  Raffle? raffle;

  @action
  storeRaffle() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    raffle = Raffle(
      name: 'Páscoa',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      quantity: 100
    );

    firestore.collection('raffles').doc().set(
        raffle!.toMap()
    );
  }

}
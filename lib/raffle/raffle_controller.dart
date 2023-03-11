import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:rifas/core/instances.dart';
import 'package:rifas/raffle/models/raffle.dart';

part 'raffle_controller.g.dart';

class RaffleController = _RaffleController with _$RaffleController;

abstract class _RaffleController with Store {

  @observable
  Raffle? raffle;

  @observable
  bool isLoading = false;

  @action
  Future<bool> storeRaffle(Raffle? raffle) async {
    bool result = false;
    isLoading = true;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    raffle!.createdBy = loginController.user!.uid;

    firestore.collection('raffles').doc().set(
        raffle.toMap()
    ).then((_) => result = true);
    isLoading = false;
    return result;
  }

}
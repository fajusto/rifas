// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$userAtom = Atom(name: '_LoginController.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      '_LoginController.signInWithEmailAndPassword',
      context: context);

  @override
  Future<String?> signInWithEmailAndPassword(String email, String password) {
    return _$signInWithEmailAndPasswordAsyncAction
        .run(() => super.signInWithEmailAndPassword(email, password));
  }

  late final _$checkAuthAsyncAction =
      AsyncAction('_LoginController.checkAuth', context: context);

  @override
  Future<bool?> checkAuth() {
    return _$checkAuthAsyncAction.run(() => super.checkAuth());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_LoginController.logout', context: context);

  @override
  Future<bool?> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}

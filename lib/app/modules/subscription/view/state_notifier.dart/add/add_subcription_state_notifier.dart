import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inscricao/app/modules/subscription/view/state_notifier.dart/add/add_subscription_state.dart';

import '../../../data/repositories/subscription_repository.dart';

class AddSubscriptionStateNotifier extends StateNotifier<AddSubscriptionState> {
  final SubscriptionRepository repository;
  AddSubscriptionStateNotifier({required this.repository})
      : super(LoadInitial());
  Future<void> load(String name, int age, String password, String email) async {
    state = LoadInProgress();
    const CircularProgressIndicator();
    try {
      await repository.addSubscription(name, age, password, email);
      state = LoadSucess();
    } catch (erro) {
      state = LoadFailure(data: "Falha ao carregar");
    }
  }
}

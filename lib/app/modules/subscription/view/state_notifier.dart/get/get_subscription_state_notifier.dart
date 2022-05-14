import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inscricao/app/modules/subscription/data/repositories/subscription_repository.dart';
import 'package:inscricao/app/modules/subscription/view/state_notifier.dart/get/get_subscription_state.dart';

class GetSubscriptionStateNotifier extends StateNotifier<GetSubscriptionState> {
  final SubscriptionRepository repository;
  GetSubscriptionStateNotifier({required this.repository})
      : super(LoadInitial());
  Future<void> load() async {
    state = LoadInProgress();
    const CircularProgressIndicator();
    try {
      final result = await repository.getSubscription();
      state = LoadSucess(data: result);
    } catch (erro) {
      state = LoadFailure(data: "Falha ao carregar");
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inscricao/app/modules/subscription/data/repositories/subscription_repository.dart';

import '../../view/state_notifier.dart/add/add_subcription_state_notifier.dart';
import '../../view/state_notifier.dart/add/add_subscription_state.dart';
import '../../view/state_notifier.dart/get/get_subscription_state.dart';
import '../../view/state_notifier.dart/get/get_subscription_state_notifier.dart';

final subscriptionProviderRepo = Provider((ref) => SubscriptionRepository());

final getSubscriptionState = StateNotifierProvider.autoDispose<
    GetSubscriptionStateNotifier, GetSubscriptionState>(
  (ref) => GetSubscriptionStateNotifier(
    repository: ref.read(subscriptionProviderRepo),
  ),
);
final addSubscriptionState = StateNotifierProvider.autoDispose<
        AddSubscriptionStateNotifier, AddSubscriptionState>(
    (ref) => AddSubscriptionStateNotifier(
        repository: ref.read(subscriptionProviderRepo)));

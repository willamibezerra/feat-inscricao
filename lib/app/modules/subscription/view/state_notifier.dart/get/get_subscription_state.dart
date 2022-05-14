import 'package:inscricao/app/modules/subscription/data/models/subscription_model.dart';

class GetSubscriptionState {}

class LoadInitial implements GetSubscriptionState {}

class LoadInProgress implements GetSubscriptionState {}

class LoadSucess implements GetSubscriptionState {
  final SubscriptionModel? data;
  LoadSucess({required this.data});
}

class LoadFailure implements GetSubscriptionState {
  final String data;
  LoadFailure({required this.data});
}

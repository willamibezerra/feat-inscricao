class AddSubscriptionState {}

class LoadInitial implements AddSubscriptionState {}

class LoadInProgress implements AddSubscriptionState {}

class LoadSucess implements AddSubscriptionState {}

class LoadFailure implements AddSubscriptionState {
  final String data;
  LoadFailure({required this.data});
}

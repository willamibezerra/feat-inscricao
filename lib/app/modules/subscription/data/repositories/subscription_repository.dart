import 'package:hive/hive.dart';
import 'package:inscricao/app/modules/subscription/data/models/subscription_model.dart';

class SubscriptionRepository {
  Future<SubscriptionModel?> getSubscription() async {
    final info = await Hive.openBox<SubscriptionModel>("subscription");
    final myInfo = info.get("subscription");
    return myInfo;
  }

  Future<void> addSubscription(
      String name, int age, String password, String email) async {
    final info = SubscriptionModel(
        age: age, name: name, password: password, email: email);
    final box = await Hive.openBox<SubscriptionModel>("subscription");
    box.put("subscription", info);
  }
}

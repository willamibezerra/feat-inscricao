import 'package:hive/hive.dart';
part 'subscription_model.g.dart';

@HiveType(typeId: 1)
class SubscriptionModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int age;

  @HiveField(2)
  late String password;
  @HiveField(3)
  late String email;
  SubscriptionModel(
      {required this.age,
      required this.name,
      required this.email,
      required this.password});
}

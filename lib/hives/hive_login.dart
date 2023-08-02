import 'package:hive/hive.dart';
part 'hive_login.g.dart';

@HiveType(typeId: 2)
class HiveLogin extends HiveObject{
  @HiveField(0)
  String? user;

  @HiveField(1)
  String? pass;

  HiveLogin({this.user, this.pass});
}
import 'package:hive/hive.dart';
part 'hive_location.g.dart';

@HiveType(typeId: 1)
class HiveLocation extends HiveObject{
  @HiveField(0)
  int stt;

  @HiveField(1)
  String? user;

  @HiveField(2)
  String? cargoOrder;

  @HiveField(3)
  double? lat;

  @HiveField(4)
  double? long;

  HiveLocation({this.stt=0, this.user, this.cargoOrder, this.lat, this.long});
}
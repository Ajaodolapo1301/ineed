import 'package:hive/hive.dart';

part 'user.g.dart';



@HiveType()
class User extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String userId;


  @HiveField(3)
  String token;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String username;


  User({this.name, this.userId, this.token, this.email, this.username,  this.phone});


  factory User.fromJson(Map <String,  dynamic> json)=>User(
      token: json["payload"]['apikey'],
      userId : json['payload']['_id'],
      name :json['payload']['name'],
      email : json['payload']['email'],
      phone : json['payload']['phone'],
    username: json["payload"]["username"]



  );

}
import 'package:hive/hive.dart';

part 'user.g.dart';



@HiveType()
class User extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  int userId;


  @HiveField(3)
  String token;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String username;


  User({this.name, this.userId, this.token, this.email, this.username,  this.phone});


  factory User.fromJson(Map <String,  dynamic> json)=>User(
      token: json['access_token'],
      userId : json['user']['id'],
      name :json['user']['name'],
      email : json['user']['email'],
      phone : json['user']['phone'],
    username: json["user"]["username"]



  );

}
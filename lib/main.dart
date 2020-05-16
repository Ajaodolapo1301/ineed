import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/model/user.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:ineed_app/screen/auth/splashPage.dart';


import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await  path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter());

  await Hive.openBox("user");
  final box = Hive.box("user");
  User user = box.get('user', defaultValue: null);
  runApp(MultiProvider(
      providers: [
//        ChangeNotifierProvider(create: (_)=>LoginState()),
        ChangeNotifierProvider(create: (_) => AppState()),


      ],

      child: MyApp(user: user,)));
}

class MyApp extends StatelessWidget {
  final User user;

  MyApp({this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: kPrimaryColor,
//        backgroundColor: kPrimaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor
        )
      ),

      home: SplashPage(
        user: user,
      ),
    );
  }
}


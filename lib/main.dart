import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';
import 'package:isitcom_chess_club/core/controller/drawer_controller.dart';
import 'package:isitcom_chess_club/core/di.dart';
import 'package:isitcom_chess_club/core/utils/dummy_data.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/controllers/clockController.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/screens/clock_create_screen.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/controllers/home_provider.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async{
  Di.init();
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

 
runApp(MultiProvider(

  providers: [
    ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ChangeNotifierProvider(create: (context) => DrawerProvider(),),
    ChangeNotifierProvider(create: (context) => ClockController(),)

        ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: ConstColors.backgroundColor
      ),
      home:const HomeScreen()
    );
  }
}

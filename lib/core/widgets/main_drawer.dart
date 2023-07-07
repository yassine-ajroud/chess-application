import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';
import 'package:isitcom_chess_club/core/constant/size.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/core/controller/drawer_controller.dart';
import 'package:isitcom_chess_club/core/widgets/drawer_item.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/screens/clock_create_screen.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return Drawer(
          child: Container(
          //  color: Colors.white,
            //height: ConstSize.maxheight(context),
            child: SingleChildScrollView(child: Column(children: [
              SizedBox(height: 200, child: Image.asset("assets/logo.jpeg",fit: BoxFit.cover,)),
             DrawerItem(icon: Icons.home_outlined, isSelected: Provider.of<DrawerProvider>(ctx).homeActivated, text: "Home",route: HomeScreen(),),
             DrawerItem(icon: Icons.person_outline_outlined ,isSelected: Provider.of<DrawerProvider>(ctx).ProfileActivated,text: "Profile",route:HomeScreen()), //route will be changed
             DrawerItem(icon: Icons.timer_outlined ,isSelected: Provider.of<DrawerProvider>(ctx).ClockActivated, text: "Clock",route: ClockCreateScreen(),),
             DrawerItem(icon: Icons.settings ,isSelected: Provider.of<DrawerProvider>(ctx).SettingsActivated, text: "Settings",route: HomeScreen(),), //route will be chnager
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ListTile( 
                
                //TODO: when tap on log out user will disconnect instead of exite from the app

                /*this line */  onTap: ()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'),   /*this line */ 
               
                leading: Icon(Icons.logout_outlined,color: ConstColors.redColor,),
            title: Text('Log Out',style: ConstTextStyles.drawerLogoutTextStyle)),
             )
            ],))),
        );
      }
    );
  }
}


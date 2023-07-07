import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/core/widgets/main_drawer.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../controller/drawer_controller.dart';


class DrawerItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String text; 
  final Widget route;
  const DrawerItem({required this.icon, required this.isSelected, required this.text,required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>route));
                                 Provider.of<DrawerProvider>(context,listen: false).activatePage(text);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        selected: isSelected,
        selectedTileColor: ConstColors.lightpurpleTextColor,
        leading: Icon(icon,color: isSelected ? ConstColors.purpleTextColor:Colors.grey,),
        title: Text(text,style: isSelected ? ConstTextStyles.drawerSelectedTextStyle : ConstTextStyles.drawerUnselectedTextStyle,),
      ),
    );
    
  }
}
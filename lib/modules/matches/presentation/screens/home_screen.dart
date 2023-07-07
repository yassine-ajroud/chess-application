
import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/controllers/home_provider.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/widgets/tab_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/main_drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState(){
    
     super.initState();
      Provider.of<HomeProvider>(context,listen: false).init();
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ConstColors.backgroundColor,
          body: CustomScrollView(
            slivers: [
             const SliverAppBar(
                floating: true,
                //snap: true,
                pinned: true,
                backgroundColor: ConstColors.backgroundColor,
               foregroundColor: ConstColors.blueTextColor,
                actions:  [Padding(
                  padding: EdgeInsets.symmetric(horizontal:10.0),
                  child: CircleAvatar(backgroundColor: Colors.grey),
                )],
              ),
            SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children:const [Text('Hello, ',style:ConstTextStyles.mediumHeaderTextStyle1 ,),Text('Yassine!',style:ConstTextStyles.boldHeaderTextStyle1 ,)],),
                    const Text('have a nice day',style: ConstTextStyles.purpleTextStyle2,),
                  const  SizedBox(height: 20,),
                    TabBar(
                      unselectedLabelColor: ConstColors.blueTextColor,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (i){
                Provider.of<HomeProvider>(context,listen: false).setindex=i;
              },
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ConstColors.blueTextColor),
              tabs:const [
                TabItem(text: "Calendar"),
                TabItem(text: "Results"),
                TabItem(text: "Ranking"),
              ],
            ),
                        Provider.of<HomeProvider>(context).isloading ?const Center(child: Padding(
                          padding:  EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(color: ConstColors.blueTextColor,),
                        )) : Container(),
                      
                        Provider.of<HomeProvider>(context).error ? SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Error occurs ! check your internet connection or try again later. '),const SizedBox(height: 10,),
                              ElevatedButton(onPressed:(){  setState(() {
                                
                              });  Provider.of<HomeProvider>(context,listen: false).init();},style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
                                 if (states.contains(MaterialState.pressed)) {
        return ConstColors.blueTextColor;
      }
      return ConstColors.purpleTextColor;
                              })),child:const Text("Reload") ,)
                            ],
                          ),
                        ):Container(),
                       
                  ],
                
                ),
              ),
        
            ),
            SliverList(delegate: SliverChildListDelegate(Provider.of<HomeProvider>(context).showList))
            ],
          ),
          drawer:const MainDrawer(),
              )),
    );
          
    
  }
}




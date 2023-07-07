import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/size.dart';
import 'package:isitcom_chess_club/core/widgets/main_drawer.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/controllers/clockController.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/widgets/input_player.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/colors.dart';

import '../../../../core/constant/text_styles.dart';

class ClockCreateScreen extends StatelessWidget {
  const ClockCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ConstColors.backgroundColor,
        foregroundColor: ConstColors.blueTextColor,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CircleAvatar(backgroundColor: Colors.grey),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Create Match',
                    style: ConstTextStyles.mediumHeaderTextStyle1,
                  ),
                  Text(
                    'friendly match',
                    style: ConstTextStyles.purpleTextStyle2,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            // width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0, -1),
                      blurRadius: 4,
                      spreadRadius: 0)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
            height: 10,
          ),
                  const Text(
                    'Game settings',
                    style: ConstTextStyles.blueTextStyle1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const InputPlayerClock(
                    hint: 'white',
                    title: 'Player 1',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputPlayerClock(
                    hint: 'black',
                    title: 'Player 2',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Move counter: ',
                          style: ConstTextStyles.purpleTextStyle2),
                      const SizedBox(
                        width: 10,
                      ),
                      Switch.adaptive(
                          activeColor: ConstColors.purpleTextColor,
                          value:
                              Provider.of<ClockController>(context).moveCounter,
                          onChanged: (value) {
                            Provider.of<ClockController>(context, listen: false)
                                .moveCounterToggle(value);
                          })
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Increment: ',
                          style: ConstTextStyles.purpleTextStyle2),
                      const SizedBox(
                        width: 10,
                      ),
                      Switch.adaptive(
                          activeColor: ConstColors.purpleTextColor,
                          value:
                              Provider.of<ClockController>(context).increment,
                          onChanged: (value) {
                            Provider.of<ClockController>(context, listen: false)
                                .incrementToggle(value);
                          }),
                    ],
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Play',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ConstColors.blueTextColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(150, 50)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
      drawer: const MainDrawer(),
    ));
  }
}

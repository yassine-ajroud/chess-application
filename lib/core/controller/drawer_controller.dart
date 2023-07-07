import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier{
  bool homeActivated=true;
  bool ProfileActivated=false;
  bool ClockActivated=false;
  bool SettingsActivated=false;

  void activatePage(String name){

    if(name == 'Home'){
homeActivated=true;
                  ProfileActivated =false;
                  ClockActivated=false;
                  SettingsActivated=false;
    }else if(name == 'Profile'){
homeActivated=false;
                  ProfileActivated =true;
                  ClockActivated=false;
                  SettingsActivated=false;
    }else if(name == 'Clock'){
      homeActivated=false;
                  ProfileActivated =false;
                  ClockActivated=true;
                  SettingsActivated=false;
    }else{
      homeActivated=false;
                  ProfileActivated =false;
                  ClockActivated=false;
                  SettingsActivated=true;

    }


    

    notifyListeners();
  }
}
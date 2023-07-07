import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';
import 'package:isitcom_chess_club/modules/matches/domain/usecases/get_all_demo_users_usecase.dart';
import 'package:isitcom_chess_club/modules/matches/domain/usecases/get_played_matches_usecase.dart';
import 'package:isitcom_chess_club/modules/matches/domain/usecases/get_unplayed_matches_usecase.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/widgets/match_widget.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/widgets/rank_widget.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/widgets/result_widget.dart';

import '../../../../core/di.dart';

class HomeProvider with ChangeNotifier{
  bool dataloaded=false;
  bool isloading=false;
  bool isemptyplayedList=false;
  bool isemptyUmplayedList=false;
  int indexList=0;
  bool error=false;
  List<Widget> playedList=[];
  List<Widget> umplayedList=[];
  List<Widget> rankList=[];

  List<DemoUser> demoPlayers=[];
  List<Widget> emptyList=const [Center(child: Text("No data yet",style: ConstTextStyles.blackTextStyle1,))];


  List<Widget> get showList{
    switch (indexList) {
      case 0:
        return umplayedList;
      case 1:
       return playedList;
       case 2:
       return rankList;
      default:
      return umplayedList;
    }
  }


  set setindex(int i){
    indexList = i;
    notifyListeners();
  }
  
  void init()async{
    if (dataloaded){
      return;
    }
    error=false;
    isloading = true;
   await getDemoPlayers();
   await getplayedMatch();
   await getumplayedMatch();
   isloading=false;
    notifyListeners();

  }

  Future<void> getplayedMatch()async{
final res =await GetPlayedMatchesUseCase(repository: sl()).call();
    res.fold((l){
      error=true;
    }, (r) {
     final l=r.cast<Match>();
     //todo: delete print statement
     print("match $l");
     playedList=l.map((e) => ResultItem(player1: getspecifiedueser(e.player1), player2: getspecifiedueser(e.player2), date: DateTime.parse(e.time),match: e,)).toList();
 if(playedList.isEmpty)
      {playedList= emptyList;}
      else{dataloaded=true;}
    });
  }

 Future< void> getumplayedMatch() async{
 final res =await GetUnPlayedMatchesUseCase(repository: sl()).call();
    res.fold((l){
      error=true;
    }, (r) {
     final l=r.cast<Match>();
     print(l);
     umplayedList=l.map((e) => MatchWidget(player1: getspecifiedueser(e.player1), player2: getspecifiedueser(e.player2),match: e,)).toList();
 if(umplayedList.isEmpty)
      {umplayedList=emptyList;}
            else{dataloaded=true;}

    });   
  }


  Future<void> getDemoPlayers()async{
    final res =await GetAllDemoUsers(repository: sl()).call();
    res.fold((l){
      error=true;
    }, (r) {
      final ls=r.cast<DemoUser>();
     demoPlayers=ls.map((e) =>DemoUser(imgUrl: e.imgUrl, userId: e.userId, firstName: e.firstName, secondName: e.secondName, rank: e.rank, pts: e.pts, rate: e.rate)).toList();
     rankList=bubbleSort(demoPlayers,demoPlayers.length).map((e) => RankWidget(user: e)).toList();
    });
  }   


  DemoUser getspecifiedueser(String userid) {
    late DemoUser res;
for (var element in demoPlayers ){
  if (element.userId==userid) {
    res=element;
  }
  
}  return res ;
}

//todo: bubbleSort function need update
    List<DemoUser> bubbleSort(List<DemoUser> users,int n){
      bool ok;
      DemoUser aux;
      do{
        ok=true;
        for(int i =0 ;i<n-1;i++){
          if(users[i].rank>users[i+1].rank){
            aux = users[i];
            users[i]=users[i+1];
            users[i+1]=aux;
            ok=false;
          }
        }
        n--;
      }while(ok==false);
        return users;
    }
}
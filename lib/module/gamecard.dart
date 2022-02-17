import 'package:flutter/cupertino.dart';

class GameCard{
  String imageAdress = "";
  String clockImage  = "assets/images/kilit.png";
  bool acikmi      = false;
  bool bulundumu   = false;
  GameCard(String imageAdress){
    this.imageAdress = imageAdress;
  }

  // ignore: non_constant_identifier_names
  Widget GetGameCard(double maxWidth){
    String seeImage = "";
    //print(acikmi);
    if(acikmi == true){
      seeImage = this.imageAdress;
    }else{
      seeImage = this.clockImage;
    }
    //print(seeImage);
    return Container(
      width: maxWidth/6,
      height: 80,
      child: Image(
        image: AssetImage(seeImage),
      ),
    );
  }

  void CardTurn(){
    if(acikmi){
      acikmi = false;
    }else{
      acikmi = true;
    }
  }

  void Bulundu(){
    this.bulundumu = true;
  }

  bool GetBulundumu(){
    return this.bulundumu;
  }

  String GetImageAdress(){
    return this.imageAdress;
  }
}
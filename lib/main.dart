import 'package:cards_game/module/gamecard.dart';
import 'package:flutter/material.dart';
import 'dart:io';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  GameCard test = new GameCard("assets/images/car.png");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildHome(),
    );
  }
}

class BuildHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
      return _BuildHomeState();
  }

}

class _BuildHomeState extends State{

  List<GameCard> cards    = [
    new GameCard("assets/images/car.png"),
    new GameCard("assets/images/masa.png"),
    new GameCard("assets/images/cicek.png"),
    new GameCard("assets/images/cat.png"),
    new GameCard("assets/images/cicek.png"),
    new GameCard("assets/images/car.png"),
    new GameCard("assets/images/masa.png"),
    new GameCard("assets/images/cat.png"),

  ];

  int acikKart = -1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title:Text("Kart Oyunu")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              InkWell(
                  child: Container(
                    width: maxWidth/6,
                    height: 80,
                  )
              ),
              InkWell(
                child: cards[0].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(0);
                  });
                },
              ),
              InkWell(
                child: cards[1].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(1);
                  });
                },
              ),
              InkWell(
                child: cards[2].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(2);
                  });
                },
              ),
              InkWell(
                child: cards[3].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(3);
                  });
                },
              )
            ]),
            Row(children: [
              InkWell(
                  child: Container(
                    width: maxWidth/6,
                    height: 80,
                  )
              ),
              InkWell(
                child: cards[4].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(4);
                  });
                },
              ),
              InkWell(
                child: cards[5].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(5);
                  });
                },
              ),
              InkWell(
                child: cards[6].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(6);
                  });
                },
              ),
              InkWell(
                child: cards[7].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(7);
                  });
                },
              )
            ]),
          ],
        ),
      ),
    );
  }

  void CardGameService(int index){

    //kart bulundu ise hiç bir şey yapmayacak.
    if(this.cards[index].GetBulundumu()){
      return ;
    }

    //Yeni bir kart seçiliyor demektir.
    //Kart numarası kayıt edilecek ve seçili kart açılacak.
    if(this.acikKart == -1){
      this.acikKart = index;
      this.cards[index].CardTurn();
      //print("bir kart secildi");
      return ;
    }

    //açık olan karta tekrar tıklar ise hiç bir işlem yapılmamalı..
    if(this.acikKart == index){
      return ;
    }
    //secili kartlar dogru ise iki kartta dogru olarak secilecek ve acik kart tekrar -1 haline getirilecektir.
    if(this.cards[index].GetImageAdress() == this.cards[acikKart].GetImageAdress()){
      this.cards[index].Bulundu();
      this.cards[acikKart].Bulundu();

      //yeni seçilen kart gorunur hale getiriliyor.
      this.cards[index].CardTurn();
      this.acikKart = -1;

      return ;
    }


    //secili kartlar dogru degil ise iki kartta once gosteriliyor, sonra kapatılıyor.
    this.cards[index].CardTurn();
    Future.delayed(const Duration(milliseconds: 1000), () {

// Here you can write your code

      setState(() {
        this.cards[index].CardTurn();
        this.cards[acikKart].CardTurn();
        acikKart = -1;
      });

    });
  }


  //Once yanlis olan kartların acik gorunmesi icin olusturuldu.
  void CardOff(){

  }
}

/*
            Row(children: [
              InkWell(
                  child: Container(
                    width: maxWidth/6,
                    height: 80,
                  )
              ),
              InkWell(
                child: cards[0].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(0);
                  });
                },
              ),
              InkWell(
                child: cards[1].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(1);
                  });
                },
              ),
              InkWell(
                child: cards[2].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(2);
                  });
                },
              ),
              InkWell(
                child: cards[3].GetGameCard(maxWidth),
                onTap: (){
                  setState(() {
                    CardGameService(3);
                  });
                },
              )
            ]),
 */



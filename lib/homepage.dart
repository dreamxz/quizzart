import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:translator/translator.dart';
import 'variables.dart';
import 'question.dart';
import 'main.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flag/flag.dart';

void soundplay() {
  final player = AudioCache();
  player.play('correct.mp3');
}

class Butao1 extends StatelessWidget {
  final int type;
  final String link;
  final Color cor;
  Butao1(this.link, this.type, this.cor);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 75,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: this.cor,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
        border: Border.all(
          color: this.cor,
          width: 1,
        ),
        image: DecorationImage(
          image: NetworkImage(this.link),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final String link;
  final double height;
  final double width;

  Background(this.link, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(this.link),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Decoration extends StatelessWidget {
  final double height;
  final double width;

  final Color c1;
  final Color c2;

  Decoration(this.height, this.width, this.c1, this.c2);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(75)),
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          this.c1,
          this.c2,
        ],
      )),
    );
  }
}

BoxDecoration Decorate(
    AlignmentGeometry begin, AlignmentGeometry end, Color cor1, Color cor2) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: [
          cor1,
          cor2,
        ],
      ));
}

const kHeadingTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 26,
  fontWeight: FontWeight.w600,
  color: Colors.white,
  letterSpacing: 1.2,
);

const kTitleTextstyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF303030),
  fontWeight: FontWeight.bold,
);

class _HomePageState extends State<HomePage> {
  Color pt = Color(0x00000000);
  Color ing = Colors.white; //Color(0x00000000);
  Color ru = Color(0x00000000);

  void translate(int linguagem, String input) {
    final translator = new GoogleTranslator();

    /*if (linguagem == 0) // ingles nao tra
    {
      //newp = translation;
      var translation = await translator
      .translate("I would buy a car, if I had money.", from: 'en', to: 'it');

    } else if (linguagem == 2) {
      translator.translate(input, to: 'ru').then((output) {
        setState(() {
          print('222');
          input = output;
        });
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.grey.shade900,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width, // with do telmovel
            height: MediaQuery.of(context).size.height,

            child: Stack(
              children: <Widget>[
                Decoration(
                  h,
                  w,
                  Colors.blue[900],
                  Colors.blue[300],
                ),
                //Positioned(
                /*Align(
                  alignment: Alignment.topRight,
                  //top: 100,
                  //right: 50,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.settings),
                    // color: ,

                    onPressed: () {
                      Navigator.pushNamed(context, 'settings');
                    },
                  ),
                ),*/
                Align(
                    //top: 20,
                    //left: 40,
                    alignment: Alignment(0, -0.6),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/quizzarttransp.png')),
                      ),
                    )),
                /*Positioned(
                  left: 30,
                  top: 160,
                  child: Text(
                    'Are you',
                    textAlign: TextAlign.left,
                    style: kHeadingTextStyle,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 195,
                  child: Text(
                    'That smart?',
                    textAlign: TextAlign.left,
                    style: kHeadingTextStyle,
                  ),
                ),*/
                Align(
                  //bottom: 150,
                  //left: (w / 2) - 80,
                  alignment: Alignment(
                      -0.0, 0.6), //Alignment.center,//Alignment.center,
                  child: GestureDetector(
                    //color: Colors.transparent,
                    //disabledColor: Colors.transparent,
                    onTap: () {
                      /*translate(linguagem, questoes[nperg].p);

                      translate(linguagem, questoes[nperg].r2[0]);
                      translate(linguagem, questoes[nperg].r2[1]);
                      translate(linguagem, questoes[nperg].r2[2]);
                      translate(linguagem, questoes[nperg].r2[3]);

                      soundplay();*/

                      //pageState.initState();
                      print(Colors.blue[900].red);
                      print(Colors.blue[900].green);
                      print(Colors.blue[900].blue);
                      print(Colors.blue[300].red);
                      print(Colors.blue[300].green);
                      print(Colors.blue[300].blue);

                      Navigator.pushNamed(context, '2');
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(125)),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'Play',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  //bottom: 150,
                  //left: (w / 2) - 80,
                  alignment: Alignment(
                      -0.0, 0.8), //Alignment.center,//Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'settings');
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(125)),
                        border: Border.all(width: 1, color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                /* Positioned(
                  bottom: 150,
                  left: (w / 2) - 80,
                  child: FlatButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue[500],
                            Colors.blue[400],
                          ],
                        ),
                      ),
                      height: 35,
                      width: 55,
                      child: Text('play'),
                    ),
                  ),
                ),*/
                /*Positioned(
                  bottom: 100,
                  //left: 30,
                  left: 30,
                  //right: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              linguagem = 0;
                              setState(() {
                                pt = Colors.white;
                                ing = Color(0x00000000);
                                ru = Color(0x00000000);
                                //corescena(0, pt, ing, ru);
                              });
                            },
                            child: Butao1(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/800px-Flag_of_Portugal.svg.png',
                                0,
                                pt),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              linguagem = 1;
                              setState(() {
                                pt = Color(0x00000000);
                                ing = Colors.white;
                                ru = Color(0x00000000);
                                //corescena(1, pt, ing, ru);
                              });
                            },
                            child: Butao1(
                                'https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/1200px-Flag_of_the_United_Kingdom.svg.png',
                                1,
                                ing),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: () {
                              linguagem = 2;
                              setState(() {
                                //  ru = Colors.cyan;
                                pt = Color(0x00000000);
                                ing = Color(0x00000000);
                                ru = Colors.white;
                              });
                            },
                            child: Butao1(
                                'https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1200px-Flag_of_Russia.svg.png',
                                2,
                                ru),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}

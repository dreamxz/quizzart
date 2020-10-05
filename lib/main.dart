import 'dart:async';

import 'package:flutter/material.dart';
import 'homepage.dart';
import 'question.dart';
import 'scorepage.dart';
import 'settings.dart';
import 'backbutton.dart';
import 'package:splashscreen/splashscreen.dart';

import 'variables.dart';

import 'package:audioplayers/audio_cache.dart';

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import 'dart:math';

void main() => runApp(QuizzApp());

void soundplay(bool xd) {
  print(Colors.blue[900]);
  print(Colors.blue[300]);
  final player = AudioCache();
  if (xd) {
    player.play('correct.mp3');
  } else {
    player.play('wrong.mp3');
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //appBar: AppBar(
      //title: Center(child: Text('Quizz App beta')),
      //backgroundColor: Colors.grey[800],
      /*actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 25,
            ),
          )
        ],*/
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue[900],
                Colors.blue[300],
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '1',
      routes: {
        '1': (context) => HomePage(),
        '2': (context) => SecondPage(),
        '3': (context) => ScorePage(),
        'settings': (context) => SettingsPage(),
      },
    );
  }
}

_QuizPageState pageState;

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() {
    pageState = _QuizPageState();
    return pageState;
  }
}

class QuizPageFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: QuizPage(),
    );
  }
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  void testprint() {
    print(certas);
    //print(nperg);
    //print(answears[nperg]);
  }

  String timers = '';

  Timer t2;

  // [0, 1, 4]
  //list.shuffle();
  //print(list);

  void inittizalize_variables() {
    linguagem = 1; // 1 default, ingles

    certas = 0;
    erradas = 0;
    nperg = 0;
    //randperg = 0;

    list = new List<int>.generate(10, (int i) => i);

    list.shuffle();

    print(list);
    print(list[nperg]);

    blue = Colors.blue[800];

    showquestion = false;

    reset_timer = false;

    disable_button = false;

    icones.clear();

    canceltimer = false;
    buttonclicked = false;

    i = 0;

    ktimer = hardcoremode ? 15 : 30;
    timer = ktimer;
  }

  @override
  void initState() {
    canceltimer = true;
    inittizalize_variables();
    starttimer();

    super.initState();
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (t2) {
      setState(() {
        //t2.cancel();
        if (timer < 1 /*&& !buttonclicked*/) {
          //showquestion = true;
          print(t2);
          t2.cancel();

          if (nperg >= 9) {
            showquestion = true;
            Timer(Duration(seconds: 2), () {
              Navigator.popAndPushNamed(
                  context, '3'); //+ de 10 passar para o score
            });
            //showquestion = false;

          } else {
            erradas++;
            icones.add(Icon(
              Icons.close,
              color: Colors.red,
            ));

            nextquestion();
          }
        } else if (canceltimer == true) {
          print('called cancel');
          t2.cancel();
        } else {
          timer = timer - 1;
        }

        timers = timer.toString();
      });
    });
  }

  void nextquestion() {
    //canceltimer = true;
    //canceltimer = false;
    //timer = ktimer;

    setState(() {
      showquestion = true;
      canceltimer = true;
      disable_button = true;
      Timer(Duration(seconds: 2), () {
        // list.shuffle(); //no need to shuffle the list again ou temos a probabilidade de calhar o numero 2x

        canceltimer = false;
        timer = ktimer;

        print('proxima questao');
        nperg++;

        print('print list' + list.toString());
        print(list[nperg]);

        starttimer();
        showquestion = false;
        disable_button = false;
      });
      //canceltimer = false;
      //t2.cancel();
    });
  }

  Color get_color(int _nresp) {
    if (questoes[list[nperg]].r == _nresp) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  void checkanswears(int _nresp) {
    if (questoes[list[nperg]].r == _nresp) // escolheu a opçao correta
    {
      // questoes[nperg] = Colors.green;
      soundplay(true);
      print('certo');
      certas++;
      icones.add(Icon(
        Icons.check_circle,
        color: Colors.green[800],
      ));
    } else {
      //questoes[nperg].answear_color = Colors.red;
      soundplay(false);
      print('errado');
      erradas++;
      icones.add(Icon(
        Icons.close,
        color: Colors.red[800],
      ));
    }
  }

  void logic(int _nresp) {
    if (nperg >= 9) {
      checkanswears(_nresp);
      //sleep(Duration(seconds: 1));

      Timer(Duration(seconds: 2), () {
        Navigator.popAndPushNamed(context, '3'); //+ de 10 passar para o score
      });

      //Navigator.popAndPushNamed(context, '2'); // resets the current widget

    } else {
      checkanswears(_nresp);
    }

    setState(() {
      nextquestion();
    });
  }

  bool xd = true;
  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
      Align(
        alignment: Alignment.topLeft,
        child: BackButtonXD('1', 1, true),
      ),

      FAProgressBar(
        //currentValue: (timer * 100 / 30).toInt(),
        currentValue: timer,
        maxValue: hardcoremode ? 15 : 30,
        displayText: 's',
        progressColor: Colors.blue[900],
        //backgroundColor: Colors.white,
        size: 35,
        borderRadius: 15,
        //size: 25,
        // animatedDuration: const Duration(milliseconds: 300),
      ),

      //Text(nperg.toString()),

      SizedBox(
        height: 20,
      ),
      Center(
        child: Text(
          (nperg + 1).toString() + '/' + '10',
          style: globalstyle(20),
        ),
      ),

      Expanded(
        flex: 4,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              questoes[list[nperg]].p,
              textAlign: TextAlign.center,
              style: globalstyle(25),
            ),
          ),
        ),
      ),
      Expanded(
        //3 oppçao
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            decoration: Decorate(Alignment.topLeft, Alignment.bottomRight,
                Colors.blue[800], Colors.indigo[900]),
            child: FlatButton(
              child: Text(
                questoes[list[nperg]].r2[0],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: showquestion && showanswears == true
                      ? get_color(1)
                      : Colors.white,
                ),
              ),
              onPressed: disable_button
                  ? null // null para evitar s
                  : () {
                      buttonclicked = true;
                      testprint();
                      logic(1);

                      //nextquestion();
                    },
            ),
          ),
        ),
      ),

      Expanded(
        //3 oppçao
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            decoration: Decorate(Alignment.topLeft, Alignment.bottomRight,
                Colors.blue[800], Colors.indigo[900]),
            child: FlatButton(
              //shape: give_shape(),
              //color: Colors.transparent,
              child: Text(
                questoes[list[nperg]].r2[1],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  //color: Colors.white,
                  color: showquestion && showanswears == true
                      ? get_color(2)
                      : Colors.white,
                ),
              ),
              onPressed: disable_button
                  ? null
                  : () {
                      buttonclicked = true;
                      testprint();
                      logic(2);
                      //nextquestion();
                      //Timer(Duration(seconds: 2), nextquestion);
                    },
            ),
          ),
        ),
      ),

      Expanded(
        //3 oppçao
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            decoration: Decorate(Alignment.topLeft, Alignment.bottomRight,
                Colors.blue[800], Colors.indigo[900]),
            child: FlatButton(
              //shape: give_shape(),
              //color: Colors.transparent,
              child: Text(
                questoes[list[nperg]].r2[2],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  // color: Colors.white,
                  color: showquestion && showanswears == true
                      ? get_color(3)
                      : Colors.white,
                ),
              ),
              onPressed: disable_button
                  ? null
                  : () {
                      buttonclicked = true;
                      testprint();
                      logic(3);
                      //nextquestion();
                    },
            ),
          ),
        ),
      ),
      Expanded(
        //4 oppçao
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            decoration: Decorate(Alignment.topLeft, Alignment.bottomRight,
                Colors.blue[800], Colors.indigo[900]),
            child: FlatButton(
              //shape: give_shape(),
              //color: Colors.transparent,
              child: Text(
                questoes[list[nperg]].r2[3],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  //color: Colors.white,
                  color: showquestion && showanswears == true
                      ? get_color(4)
                      : Colors.white,
                ),
              ),
              onPressed: disable_button
                  ? null
                  : () {
                      buttonclicked = true;
                      testprint();
                      logic(4);
                    },
            ),
          ),
        ),
      ),

      Row(
        children: icones,
      ),
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children2,
    );
  }
}

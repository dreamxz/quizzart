import 'package:flutter/material.dart';
import 'main.dart';

/// Pagina das opçoes, colocar aqui todas as variaves e widgets usados em todos os screens, etc
///

int linguagem = 1; // 1 default, ingles // 0 = portugues

//// Widgets states
///
///

int certas = 0;
int erradas = 0;
int nperg = 0;

int randperg;

List<int> list = [];

var blue = Colors.blue[800];

bool showquestion = false;

bool reset_timer = false;

bool disable_button = false;

int ktimer = hardcoremode ? 15 : 30;
int timer = ktimer;

TextStyle globalstyle(double fsize) {
  return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: fsize,
      //color: Colors.white,
      color: Colors.white);
}

bool canceltimer = false;
bool buttonclicked = false;

int i = 0;

//class Options {
bool playsound = true;
bool showanswears = true; //mostrar as respostas
bool vibration = true;
bool hardcoremode = false;
//rest of the options
//}

//Options options;

var s1 =
    'Congratulations you completed the quiz, but you could do a better result, try again!';
var s2 =
    'Congratulations you completed the quiz\n with an average result, lets go for the excellent result?';
var s3 =
    'Congratulations you completed the quiz with an excellent result! Challange your friends now!';

String result_message(int c) {
  if (c < 5) {
    return s1;
  } else if (c >= 5 && c < 8)
    return s2;
  else if (c >= 8) return s3;
}

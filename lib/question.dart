import 'package:flutter/material.dart';

class Question {
  String p;
  int r;
  List<String> r2;

  Question({this.p, this.r, this.r2});
}

List<String> perguntas = [
  'What is the largest planet in our Solar System?',
  'How many blue stripes does the United States of America national flag have?',
  'What is the largest country, by area, that has only one time zone?',
  'Which country hosted the Summer Olympics in 2016?',
  'Trichology is the study or science of what?',
  'Alfred Nobel born in 1883 was most know for what invention?',
  'Which of these countries was not a Soviet Republic in USSR?',
  'What was the first successful vaccine developed in history?',
  'Which of these cities is closest to London, UK?',
  'What travels at just under 300,000 kilometres per second?',
  ''
];

List<String> perguntas2 = [
  ' teste pt',
];

List<String> respostas = ['Pluto', 'Saturn', 'Earth', 'Jupiter'];
List<String> respostas1 = ['6', '7', '13', '0'];
List<String> respostas2 = ['Russia', 'Australia', 'Turkey', 'China'];
List<String> respostas3 = ['Brazil', 'Greece', 'Spain', 'South Africa'];
List<String> respostas4 = [
  'Study of hair',
  'Study of dreams',
  'Study of Children',
  'Study of muscles'
];
List<String> respostas5 = ['Gunpoweder', 'Dynamite', 'Atomic bomb', 'Nobelium'];

List<String> respostas6 = ['Moldava', 'Azerbaijan', 'Serbia', 'Kyrgyzstan'];

List<String> respostas7 = ['Cholera', 'Smallpox', 'Rabies', 'Scarlet Fever'];
List<String> respostas8 = ['New York', 'Miami', 'Boston', 'Atlanta'];
List<String> respostas9 = ['Bullet', 'Sound', 'Usain Bolt', 'Light'];

List<Widget> icones = [];

List<Question> questoes = [
  Question(p: perguntas[0], r: 4, r2: respostas),
  Question(p: perguntas[1], r: 4, r2: respostas1),
  Question(p: perguntas[2], r: 4, r2: respostas2),
  Question(p: perguntas[3], r: 1, r2: respostas3),
  Question(p: perguntas[4], r: 1, r2: respostas4),
  Question(p: perguntas[5], r: 2, r2: respostas5),
  Question(p: perguntas[6], r: 3, r2: respostas6),
  Question(p: perguntas[7], r: 2, r2: respostas7),
  Question(p: perguntas[8], r: 3, r2: respostas8),
  Question(p: perguntas[9], r: 4, r2: respostas9),
  // Question(p: perguntas[0], r: 1, r2: respostas),
  // Question(p: perguntas[0], r: 1, r2: respostas),
  //Question(p: perguntas[0], r: 1, r2: respostas),
];

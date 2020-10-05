import 'package:flutter/material.dart';
import 'backbutton.dart';
import 'variables.dart';
import 'package:confetti/confetti.dart';
import 'package:pie_chart/pie_chart.dart';

import 'dart:math';

import 'dart:async';

class ScorePage extends StatefulWidget {
  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  ConfettiController _controllerCenter;

  void play() {
    if (certas >= 5) {
      _controllerCenter.play();
    }
  }

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
  ];

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    Timer(Duration(seconds: 2), () {
      //adicionar um timer para o widget dar build completo...
      play();
    });

    //dataMap.putIfAbsent("Wrong", () => 5);
    //dataMap.putIfAbsent("Correct", () => 5);

    dataMap.putIfAbsent("Wrong", () => erradas.toDouble());
    dataMap.putIfAbsent("Correct", () => certas.toDouble());

    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                    false, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.white,
                  Colors.pink,
                  Colors.yellow,
                  Colors.red
                ], // manually specify the colors to be used
              ),
            ),

            //TOP CENTER - shoot down
            /*Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirection: pi / 2,
                maxBlastForce: 5, // set a lower max blast force
                minBlastForce: 2, // set a lower min blast force
                emissionFrequency: 0.05,
                numberOfParticles: 20, // a lot of particles at once
                gravity: 1,
              ),
            ),*/
            /*PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.7,
              showChartValuesInPercentage: true,
              showChartValues: true,
              showChartValuesOutside: false,
              chartValueBackgroundColor: Colors.grey[200],
              colorList: colorList,
              showLegends: true,
              legendPosition: LegendPosition.right,
              decimalPlaces: 1,
              showChartValueLabel: true,
              initialAngle: 0,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc,
            ),*/

            Positioned(
              //alignment: Alignment(0.8, -1),
              top: 80,
              left: 100,
              child: PieChart(
                dataMap: dataMap,
                animationDuration: Duration(seconds: 1),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 4,
                showChartValuesInPercentage: false,
                showChartValues: true,
                showChartValuesOutside: true,
                chartValueBackgroundColor: Colors.grey[200],
                colorList: colorList,
                showLegends: true,
                legendStyle: globalstyle(14.0),
                legendPosition: LegendPosition.right,
                decimalPlaces: 0,
                showChartValueLabel: false,
                initialAngle: 0,
                chartValueStyle: globalstyle(14.0),
                //chartType: ChartType.disc,
                chartType: ChartType.ring,
              ),
            ),

            Align(
              alignment: Alignment.center,
              //child: Container(
              // width: MediaQuery.of(context).size.width - 30,
              child: Text(result_message(certas),
                  style: globalstyle(21), textAlign: TextAlign.center),
              //  ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: BackButtonXD('1', 0, true),
            ),

            /* Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/sadsmile.png')),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

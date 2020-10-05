import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'backbutton.dart';
import 'variables.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class OnButton extends StatefulWidget {
  int type;
  bool boption;
  OnButton(this.type, this.boption);

  @override
  _OnButtonState createState() => _OnButtonState();
}

class _OnButtonState extends State<OnButton> {
  bool getoption() {
    if (this.widget.type == 0) {
      return showanswears;
    } else {
      return hardcoremode;
    }
  }

  void defineoption1(bool b) {
    if (this.widget.type == 0) {
      showanswears = b;
    } else {
      hardcoremode = b;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: 45,
            //height: 30,
            //  color: this.widget.variable ? Colors.blue[900] : Colors.transparent,
            decoration: BoxDecoration(
              color:
                  this.widget.boption ? Colors.blue[900] : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              //border: Border.all(width: 1, color: Colors.white),
            ),
            child: Center(
              child: Text(
                'ON',
                style: globalstyle(17),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              defineoption1(true);
              this.widget.boption = true;
            });
          },
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          child: Container(
            //  color: this.widget.variable ? Colors.blue[900] : Colors.transparent,-
            width: 45,
            // height: 30,
            decoration: BoxDecoration(
              color:
                  this.widget.boption ? Colors.transparent : Colors.blue[900],
              borderRadius: BorderRadius.all(Radius.circular(30)),
              //border: Border.all(width: 1, color: Colors.white),
            ),
            child: Center(
              child: Text(
                'OFF',
                style: globalstyle(17),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              defineoption1(false);
              this.widget.boption = false;
            });
          },
        ),
      ],
    );
  }
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //var h = MediaQuery.of(context).size.height;

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    double get_val() {
      if (h > 500 && h < 800)
        return 1;
      else if (h > 1000)
        return 1.15;
      else
        return 0.85; //0.85;
    }

    //var h_multi =

    var xd = (85 * get_val());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  //Navigator.of(context).pushNamed('1');
                },
              ),
            ),
          ),
        ],
        title: Center(
            child: Text(
          'Settings',
          textAlign: TextAlign.center,
          style: globalstyle(20),
        )),
      ),
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

            /*  IconButton(icon: Icon(vibrate ? Icons.x), 
            
            onPressed: (){

            })*/
            Positioned(
              top: 40,
              child: Container(
                width: w,
                height: 35,
                color: Colors.blue[900],
                child: Center(
                  child: Text(
                    'Game Options',
                    style: globalstyle(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: xd, //75,
              right: 20,
              child: IconButton(
                  icon: Icon(
                    Icons.vibration,
                    size: 35,
                    color: vibration ? Colors.white : Colors.red[200],
                  ),
                  onPressed: () {
                    setState(() {
                      print(xd);
                      print(h / 4.5);
                      print(h);

                      vibration = !vibration;
                    });
                  }),
            ),
            Positioned(
              top: xd,
              left: 20,
              child: IconButton(
                  icon: Icon(
                    playsound ? Icons.volume_up : Icons.volume_off,
                    size: 35,
                    color: playsound ? Colors.white : Colors.red[200],
                  ),
                  onPressed: () {
                    setState(() {
                      print(get_val());
                      playsound = !playsound;
                    });
                  }),
            ),
            Positioned(
              top: (151 * get_val()),
              child: Container(
                width: w,
                height: 35,
                color: Colors.blue[900],
                child: Center(
                  child: Text(
                    'Other options',
                    style: globalstyle(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (195 * get_val()),
              child: Text(
                'Show correct answears',
                style: globalstyle(17),
              ),
            ),
            Positioned(
              top: (195 * get_val()),
              right: 10,
              child: OnButton(0, showanswears),
            ),
            Positioned(
              top: (220 * get_val()),
              child: Text(
                'Hardcore mode',
                style: globalstyle(17),
              ),
            ),
            Positioned(
              top: (220 * get_val()),
              right: 10,
              child: OnButton(1, hardcoremode),
            ),
            Positioned(
              top: (273 * get_val()),
              child: Container(
                width: w,
                height: 35,
                color: Colors.blue[900],
                child: Center(
                  child: Text(
                    'Idioms',
                    style: globalstyle(20),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 340,
                child: Row(
                  children: [
                    Text('teste1'),
                    Text('teste2'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

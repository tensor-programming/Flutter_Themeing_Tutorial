import 'package:flutter/material.dart';
import 'package:beta_three_examples/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildThemeData(),
      home: MyHomePage(),
    );
  }
}

ThemeData buildThemeData() {
  final baseTheme = ThemeData(
    fontFamily: "FiraCode",
  );

  return baseTheme.copyWith(
    primaryColor: kPrimaryColor,
    primaryColorDark: kPrimaryDark,
    primaryColorLight: kPrimaryLight,
    accentColor: kSecondaryColor,
    bottomAppBarColor: kSecondaryDark,
    buttonColor: kSecondaryColor,
    sliderTheme: SliderThemeData.fromPrimaryColors(
      primaryColor: kPrimaryColor,
      primaryColorDark: kPrimaryDark,
      primaryColorLight: kPrimaryLight,
      valueIndicatorTextStyle: TextStyle(),
    ),
    textTheme: TextTheme().copyWith(
        subhead: TextStyle(
      fontFamily: "SnackerComic",
    )),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController controller;
  double value = 0.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Flutter Beta 3'),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20.0,
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.backspace),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.http),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // FloatingActionButton.extended()
        onPressed: () {
          controller.forward();
          if (controller.isCompleted) {
            controller.reverse();
          }
        },
        child: Icon(Icons.home),
        // label: Text('Go Home'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FAB(controller),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Chip(
                  avatar: CircleAvatar(
                    child: Text('TP'),
                  ),
                  label: Text('Tensor-Programming'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete_forever),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Chip(
                  avatar: CircleAvatar(
                    child: Text('FF'),
                  ),
                  label: Text('Flutter Framework'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete_forever),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Username"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: "Password"),
                ),
              ),
              SliderTheme(
                  data: SliderThemeData.fromPrimaryColors(
                    primaryColor: Colors.black,
                    primaryColorDark: kPrimaryDark,
                    primaryColorLight: kPrimaryLight,
                    valueIndicatorTextStyle: TextStyle(),
                  ),
                  child: Slider(
                    value: value,
                    onChanged: (val) {
                      setState(() => value = val.roundToDouble());
                    },
                    min: 0.0,
                    max: 10.0,
                    divisions: 10,
                  )),
              Container(
                  child: Card(
                color: Theme.of(context).accentColor,
                elevation: 5.0,
                shape: BeveledRectangleBorder(),
                child: Text(
                  'Hello There this is a Card!',
                  style: TextStyle(
                    fontFamily: "SnackerComic",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
              )),
              Container(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Push Me'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FAB extends FloatingActionButtonAnimator {
  final AnimationController controller;

  FAB(
    this.controller,
  );

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    if (progress < 0.5) {
      return begin;
    } else {
      return end;
    }
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    return TrainHoppingAnimation(
      Tween<double>(begin: 1.0, end: -1.0).animate(controller),
      Tween<double>(begin: 1.0, end: -1.0).animate(controller),
    );
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 0.0).animate(controller);
  }
}

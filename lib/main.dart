import 'dart:ui';

import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}
class LoginPage extends StatefulWidget
{
  @override
 State createState()=> new LoginPageState();
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController=new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation=new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand,
        children: [
          new Image(
              image: new AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                new FlutterLogo(
                  size: _iconAnimation.value*100,
                ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child:new  Theme(
                    data: new ThemeData(
                      brightness: Brightness.dark,primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color: Colors.teal,fontSize: 20.0
                        )
                      )
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),
                        new MaterialButton(
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.green,
                          splashColor: Colors.pink,
                          textColor: Colors.white,
                         //child: new Text("Login"),
                          child: new Icon(Icons.login),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )

        ],
      ),
    );
  }

}

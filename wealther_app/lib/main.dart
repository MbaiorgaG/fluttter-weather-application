import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert'; //Convert data from one representation to another.

void main() => runApp(
  MaterialApp(
    title: "weather Application",
    home: Home(),
  )
);

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {

  var temp;
  var description;
  var humidity;
  var windSpeed;
   Future getWeather() async{
     http.Response response =await http.get("");
   }
  @override
  Widget build(BuildContext context) {
    //Scafold is a class in flutter which provide many widgets(eg, navigation drawers, snackbar etc)
    //This scafold will contain the fluter UI for our application
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width, // this will get the size of the device.
            color: Colors.red,
            child: Column(

              //create aligment.
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Abuja",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Text(
                  "52\u00B0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Rain",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Temperature"),
                    trailing: Text("52\u00B0"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humidity"),
                    trailing: Text("12"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text("Weather"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind speed"),
                    trailing: Text("wind"),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}

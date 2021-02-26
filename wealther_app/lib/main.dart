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
  var currently;
  var humidity;
  var windSpeed;
   Future getWeather() async{
     http.Response response =await http.get("http://api.openweathermap.org/data/2.5/weather?q=Abuja&units=imperial&appid=1117da374f53c32e01bd59d156be9f05");
     var result = jsonDecode(response.body);
     setState(() {
       this.temp = result['main']['temp'];
       this.description = result['weather'][0]['description'];
       this.currently = result['weather'][0]['main'];
       this.humidity = result['main']['humidity'];
       this.windSpeed = result['wind']['speed'];
     });

   }

  @override
  void initState() {
    super.initState();
    this.getWeather();
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
                  temp != null ? temp.toString()+"\u00B0": "loading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    currently != null ? currently.toString()+"\u00B0": "loading...",
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
                    trailing: Text(temp != null ? temp.toString()+"\u00B0":"loading..."),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Humidity"),
                    trailing: Text(humidity != null ? humidity.toString():"loading..."),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("Weather"),
                    trailing: Text(description != null?description.toString():"loading"),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Wind speed"),
                    trailing: Text(windSpeed != null? windSpeed.toString():"loading"),
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

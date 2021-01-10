import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String bgImage = data['isDayTime'] ? 'assets/day.jpg' : 'assets/night.jfif';
    Color bgString = data['isDayTime'] ? Colors.blue :Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgString,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover, 
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Edit location",
                     style: TextStyle(
                       color: Colors.white,
                     ),
                  ),
                ),
                SizedBox(height:20.0),
                Center(
                  child:Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ) 
                  ),
                ),
                Center(
                  child:Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

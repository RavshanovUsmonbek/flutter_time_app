import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String url;
  String flag;
  bool isDayTime;

  WorldTime({this.location, this.url, this.flag});

  Future<void> getTime() async {
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        String datetime = jsonResponse['datetime'];
        String offset = jsonResponse['utc_offset'].substring(1, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        isDayTime = now.hour > 7 && now.hour < 20 ? true :false;
        time = DateFormat.jm().format(now);
      }
    } catch (e) {
      time = "could not get the time";
    }
  }
}

import 'package:http/http.dart' as http;

import 'datamodel.dart';

class DataApi {
  static var client = http.Client();

  static Future fetPostData() async {
    var response = await client.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbw-i79Epj1aS9P8zmemUd1buF0ChxXDZYkm1VEwQxpznMxmnX4jMlG2ftUn1z8KHdnRvA/exec"));

    if (response.statusCode == 200) {
      var postjsonData = response.body;

      print(postjsonData);
      return userDataModelFromJson(postjsonData);
    }
  }
}

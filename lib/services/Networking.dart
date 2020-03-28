import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper {

  NetworkHelper(this.url);

  final String url;

  Future getData () async {

    Map<String, String> headers = {
      'x-rapidapi-host' : 'covid-193.p.rapidapi.com',
      'x-rapidapi-key':'fa72a7367bmsh8a1469ba011a6f8p1626c4jsn94f914e239e2'
    };
    http.Response response = await http.get(url, headers: headers);
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
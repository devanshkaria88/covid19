import 'Networking.dart';

class CasesModel {
  var country;
  Future<dynamic> getCountryCases(String country) async{
    var url = 'https://covid-193.p.rapidapi.com/history?country=$country';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    country = data['parameters']['country'];
    return data;
  }
}
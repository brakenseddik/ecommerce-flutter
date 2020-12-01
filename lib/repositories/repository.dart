import 'package:http/http.dart' as http;

class Repository {
  var baseUrl = 'http://192.168.1.3:8000/api';
  getUrl(String api) async {
    return await http.get(baseUrl + "/" + api);
  }
}

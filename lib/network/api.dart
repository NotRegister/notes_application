import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://127.0.0.1:8000/api/';
  var url = 'http://127.0.0.1:8000/api/';

  var token;

/*   _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var tokenString = localStorage.getString('token');
    if (tokenString != null) {
      token = jsonDecode(tokenString)['token'];
    }
    // token = jsonDecode(localStorage.getString('token'))['token'];
  } */


  getData(url) async {
    var defaultUrl = await getData(Uri.parse(url));
    return await http.get(defaultUrl, headers: _setHeaders());
  }
    /* var fullUrl = _url + apiURL ;*/
    // await _getToken();

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
}
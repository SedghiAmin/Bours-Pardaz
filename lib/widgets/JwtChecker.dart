import 'dart:convert';

import 'package:http/http.dart' as http;

class JwtChecker {
  checkJWT(String jwt, http.Client client, var context) async {
    final response = await client.post(
      Uri.parse('http://bourspardaz.ir/api/protected.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{'jwt': jwt},
      ),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      //final userJson = jsonDecode(utf8.decode(response.bodyBytes));

      //print("jwt => " + jwt);
      return jwt;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      //throw Exception('خطا در ورود به سامانه');
      //print("ERROR From JWt Checker => " + jwt);
      //jwt = '';
      return "";
    }
  }
}

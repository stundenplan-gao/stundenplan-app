
import 'dart:convert';

import 'restAPIClasses.dart';
import 'package:http/http.dart';

class RestAPI {
  static String prefix = "http://";
  static String suffix = "/stundenplan_server/stundenplan";
  static String URL;

  String username;
  String password;
  String token;

  static void setUrl(String URL) {
    RestAPI.URL = prefix + URL + suffix;
  }

  static Future<bool> testConnection() async {
    RestAPI testAPI = RestAPI.forRegistration();
    String resp = await testAPI.echo("Testing connection...");
    return "Testing connection..." == resp;
  }

  RestAPI(this.username, this.password);

  RestAPI.forRegistration();

  Future<String> echo(String message) async {
    String path = "/schueler/echo";
    String URI = Uri.encodeFull(URL + path + "?message=" + message);
    Response response;
    try {
      print("Testing connection to '${URI}'");
      response = await get(URI);
      print("Response Status:" + response.statusCode.toString());
      print("Response Body:" + response.body);
      return response.body;
    } on Exception catch (e) {
      print("Failed!");
    }
    return null;
  }

  Future<bool> register(String username, String password, String firstname, String lastname) async {
    String path = "/schueler/register";
    NeuerNutzer nutzer = NeuerNutzer(firstname, lastname, username, password);
    print(jsonEncode(nutzer));
    Response resp = await post(URL + path, body: jsonEncode(nutzer), headers: {'Content-Type': 'Application/Json'});
    print(resp.statusCode);
    print(resp.reasonPhrase);
    return resp.statusCode == 200;
  }

  Future<bool> login() async {
    String path = "/schueler/login";
    print("${username}, ${password}");
    Response resp = await post(URL + path, body: {'username': username, 'password': password}, headers: {'': ''});
    print(resp.statusCode);
    print(resp.body);
    token = resp.body;
  }
}

class ConnectionTest {
  bool working = false;
  String URL = "";
  bool showError = false;

  ConnectionTest();

  void setURL(String URL) {
    if (this.URL == URL || URL.isEmpty)
      return;
    this.URL = URL;
    working = false;
    showError = false;
    checkConnection();
  }

  Future<void> checkConnection() {
    return Future.sync(() async {
      working = await RestAPI.testConnection();
      return;
    });
  }

  bool isWorking() {
    showError = !working;
    return working;
  }

  static bool test(String URL) {

  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'restAPI.dart';

class Connecting extends StatefulWidget {
  @override
  _ConnectingState createState() => _ConnectingState();
}

class _ConnectingState extends State<Connecting> {

  Future<void> testConnection() {
    return Future.sync(() async {
      if (await RestAPI.testConnection()) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.popAndPushNamed(context, '/');
      }
      return;
    });
  }

  @override
  void initState() {
    super.initState();
    testConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
            color: Colors.blueAccent,
            size: 60,
          )
      ),
    );
  }
}

class LoggingIn extends StatefulWidget {
  @override
  _LoggingInState createState() => _LoggingInState();
}

class _LoggingInState extends State<LoggingIn> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
            color: Colors.blueAccent,
            size: 60,
          )
      ),
    );
  }
}

class SetURL extends StatefulWidget {
  @override
  _SetURLState createState() => _SetURLState();
}

class _SetURLState extends State<SetURL> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 200.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        autofocus: true,
                        autovalidate: false,
                        autocorrect: false,
                        controller: textController,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.computer),
                          hintText: 'Server IP der REST API...',
                          labelText: 'Server IP',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton.icon(
                        icon: Icon(Icons.send),
                        label: Text("Verbinden"),
                        onPressed: () {
                          RestAPI.setUrl(textController.text);
                          Navigator.pushNamed(context, '/connecting');
                        },
                      )
                    ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Map data;

  Future<void> login() {
    return Future.sync(() async {
      RestAPI api = RestAPI(data['username'], data['password']);
      if (await api.login()) {
        Navigator.pushReplacementNamed(context, '/stundenplan', arguments: {'token': api.token});
      } else {
        Navigator.popAndPushNamed(context, '/');
      }
      return;
    });
  }

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    login();
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 320.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: true,
                          autovalidate: true,
                          autocorrect: false,
                          controller: nameController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.alternate_email),
                            hintText: 'Deine @gao-online.de E-Mail-Adresse',
                            labelText: 'Benutzername',
                          ),
                          validator: (String value) {
                            return value.endsWith("@gao-online.de") ? null : "Muss auf @gao-online.de enden!";
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Dein Passwort',
                            labelText: 'Passwort',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("Registrieren"),
                              onPressed: () {
                                print("Register: ${nameController.text}");
                                print("Password: ${passwordController.text}");
                                Navigator.pushReplacementNamed(context, '/register', arguments: {'username': nameController.text, 'password': passwordController.text});
                              },
                            ),
                            RaisedButton.icon(
                              icon: Icon(Icons.send),
                              label: Text("Anmelden"),
                              onPressed: () {
                                print("Username: ${nameController.text}");
                                print("Password: ${passwordController.text}");
                              },
                            ),
                          ],
                        )
                      ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final vornameController = TextEditingController();
  final nachnameController = TextEditingController();

  @override
  void dispose() {
    vornameController.dispose();
    nachnameController.dispose();
    super.dispose();
  }

  Map data;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 320.0,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: true,
                          autovalidate: false,
                          autocorrect: false,
                          controller: vornameController,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.perm_identity),
                            hintText: 'Max',
                            labelText: 'Vorname',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),TextFormField(
                          controller: nachnameController,
                          decoration: const InputDecoration(
                            hintText: 'Mustermann',
                            labelText: 'Nachname',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton.icon(
                              icon: Icon(Icons.send),
                              label: Text("Erstellen"),
                              onPressed: () {
                                print("Vorname: ${vornameController.text}");
                                print("Nachname: ${nachnameController.text}");
                                Navigator.pushNamed(context, '/registering', arguments: {'username': data['username'], 'password': data['password'], 'firstname': vornameController.text, 'lastname': nachnameController.text});
                              },
                            ),
                          ],
                        )
                      ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterAccount extends StatefulWidget {
  @override
  _RegisterAccountState createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {

  Map data;

  Future<void> register() {
    return Future.sync(() async {
      RestAPI api = RestAPI.forRegistration();
      if (await api.register(data['username'], data['password'], data['firstname'], data['lastname'])) {
        Navigator.pushReplacementNamed(context, '/loggingIn');
      } else {
        Navigator.popAndPushNamed(context, '/');
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    register();
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
            color: Colors.blueAccent,
            size: 60,
          )
      ),
    );
  }
}



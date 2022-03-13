import 'package:flutter/material.dart';
import 'package:tugas2_navigation/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(children: [
              _createImage(),
              _textLogo(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
              _forgetPassword(),
            ]),
          ),
        ),
      ),
    );
  }


  Widget _createImage() {
    return Image.network(
        "https://prodihumas.upnyk.ac.id/asset/images/Logo_UPN_Yogyakarta_Terbaru_resmi.png",
        height: 150,
        width: 150
    );
  }


  Widget _textLogo() {
    return Container(
      padding: EdgeInsets.fromLTRB(17, 45, 10, 30),
      alignment: Alignment.center,
      width: 330.0,
      child: const Text("KOPERASI UPN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isLoginSuccess) ? Colors.green : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isLoginSuccess) ? Colors.green : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.green : Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (username == "admin" && password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            _loginProcess(context);
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _forgetPassword() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.black45,
      ),
      child: const Text('Forgot Password?'),
    );
  }

  void _loginProcess(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return const HomePage();
    }));
  }
}




import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../Utils/auth_manager.dart';
import '../../../Pets/Identification/Pages/HomePage.dart';
import 'Register.dart';
import '../ApiService/Api_Service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3C444C),
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 0.0),
              child: Image.asset(
                'assets/images/Logo.png',
                width: 25.0,
                height: 25.0,
              ),
            ),
            Text('Grada'),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () async {
                // Obtiene el correo electrónico y la contraseña del usuario
                String email = emailController.text;
                String password = passwordController.text;

                ApiService.login(
                  email: email,
                  password: password,
                  context: context,
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent),
                overlayColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Container(
                width: 80.0,
                height: 24.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(60, 68, 76, 1),
                      Color.fromRGBO(60, 68, 76, 1),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.transparent),
                overlayColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Container(
                width: 80.0,
                height: 24.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(242, 122, 84, 1),
                      Color.fromRGBO(161, 84, 242, 1),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    'Registrarse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100.0),
            width: 304.0,
            height: 459.0,
            child: Card(
              color: Color(0xFF3C444C),
              margin: EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Correo electrónico',
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Ingrese su correo electrónico',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 1.0),
                              ),
                            ),
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Ingrese su contraseña',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      width: 150.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(242, 122, 84, 1),
                            Color.fromRGBO(161, 84, 242, 1),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          // Obtiene el correo electrónico y la contraseña del usuario
                          String email = emailController.text;
                          String password = passwordController.text;

                          ApiService.login(
                            email: email,
                            password: password,
                            context: context,
                          );
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                        ),
                        child: Text(
                          'Iniciar sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

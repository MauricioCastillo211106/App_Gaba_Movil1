import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../Pets/Identification/Pages/HomePage.dart';
import '../../../Utils/auth_manager.dart';

class ApiService {
  static Future<void> registerUser({
    required String name,
    required String email,
    required String city,
    required String password,
  }) async {
    // Crea una instancia de http.MultipartRequest
    var request = http.MultipartRequest('POST', Uri.parse('https://backmovilfuncionaespero-production.up.railway.app/register'));

    // Agregar los campos (nombre, email, ciudadEstado, contrasena) a la solicitud
    request.fields['nombre'] = name;
    request.fields['email'] = email;
    request.fields['ciuadadEstado'] = city;
    request.fields['contrasena'] = password;

    // Enviar la solicitud y obtener la respuesta
    http.StreamedResponse response = await request.send();

    // Verifica el código de respuesta del backend
    if (response.statusCode == 200) {
      // El registro fue exitoso, procesa la respuesta aquí
      String responseBody = await response.stream.bytesToString();
      print('Registro exitoso: $responseBody');
      // Puedes mostrar un mensaje de éxito o realizar otras acciones necesarias
    } else {
      // Ocurrió un error en el registro, procesa la respuesta aquí
      print('Error en el registro: ${response.reasonPhrase}');
      // Muestra un mensaje de error o realiza otras acciones necesarias
    }
  }
  static Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://backmovilfuncionaespero-production.up.railway.app/login?email=${email}&contrasena=${password}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> responseData = jsonDecode(responseBody);
      String token = responseData['token'];

      // Almacena el token en AuthManager
      AuthManager.instance.setToken(token);
      if (responseData.containsKey('message') &&
          responseData['message'] == 'Inicio de sesión exitoso') {
        // El inicio de sesión fue exitoso, procesa la respuesta aquí
        print("Bienvenido");

        // Redirige a la página principal
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    }
  }
}

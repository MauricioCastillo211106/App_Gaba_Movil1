import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../Utils/auth_manager.dart';
import 'dart:io';
import '../../../Pets/Identification/Pages/HomePage.dart';

class ApiService {
  static Future<void> enviarDatosAlBackend({
    required String nombre,
    required String raza,
    required String horario,
    required String ubicacion,
    required String descripcion,
    required File? image, // Agrega un parámetro para la imagen
  }) async {
    String? token = AuthManager.instance.getToken() ?? '';

    var url =
        'https://backmovilfuncionaespero-production.up.railway.app/formAdopted';
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);

    request.fields['nombre'] = nombre;
    request.fields['raza'] = raza;
    request.fields['horario'] = horario;
    request.fields['ubicacion'] = ubicacion;
    request.fields['descripcion'] = descripcion;

    // Agregar la imagen adjunta si está seleccionada
    if (image != null) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();

      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      mostrarDialogoExito;
    } else {
      print(response.reasonPhrase);
    }
  }

  static void mostrarDialogoExito(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Éxito"),
          content: Text("El formulario se envió correctamente."),
          actions: [
            TextButton(
              onPressed: () {

                // Puedes realizar más acciones aquí después de cerrar el diálogo
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}

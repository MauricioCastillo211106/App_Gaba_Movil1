import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Utils/auth_manager.dart';

class ApiService {
  static Future<List<Map<String, String>>> getDataFromBackend() async {
    // Tu lógica para obtener el token de autenticación
    String? token = AuthManager.instance.getToken() ?? '';

    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request(
      'GET',
      Uri.parse('https://backmovilfuncionaespero-production.up.railway.app/getAdopted'),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      List<dynamic> jsonData = json.decode(responseBody);
      List<Map<String, String>> data = [];
      for (var item in jsonData) {
        Map<String, String> petData = {
          'nombre': item['nombre'],
          'raza': item['raza'],
          'horario': item['horario'],
          'ubicacion': item['ubicacion'],
          'descripcion': item['descripcion'], // Asegúrate de agregar la descripción aquí si está presente en la respuesta del backend
          'image': item['image'],
        };
        data.add(petData);
      }
      return data;
    } else {
      print('Error en la solicitud: ${response.reasonPhrase}');
      return [];
    }
  }
}

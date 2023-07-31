import 'package:flutter/material.dart';

class AdoptionCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String horario;
  final String ubicacion;
  final String raza; // Agregar el campo "raza" aquí

  const AdoptionCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.horario,
    required this.ubicacion,
    required this.raza, // Agregar esta línea
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF3C444D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 334,
            height: 219,
            alignment: Alignment.center,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 36),
            tileColor: Colors.transparent,
            title: Container(
              width: 270,
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'ZillaSlab',
                  color: Colors.white,
                  fontSize: 24,
                  height: 2,
                ),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descripcion: $description',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFCBCFD4),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Raza: $raza',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFCBCFD4),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Horario de citas: $horario',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFCBCFD4),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ubicación: $ubicacion',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFCBCFD4),
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(242, 122, 84, 1),
                  Color.fromRGBO(161, 84, 242, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // Acción del botón
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 40),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Text(
                'Adoptar',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

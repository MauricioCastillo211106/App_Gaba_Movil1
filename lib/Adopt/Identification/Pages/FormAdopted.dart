import 'package:flutter/material.dart';
import 'package:untitled/Adopt/Identification/Pages/AddPets.dart';
import '../../../Pets/Identification/Pages/HomePage.dart';

class FormAdopted extends StatefulWidget {
  const FormAdopted({Key? key}) : super(key: key);
  @override
  _FormAdoptedState createState() => _FormAdoptedState();
}

class _FormAdoptedState extends State<FormAdopted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3C444C),
        title: Row(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            Text('GRADA'),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Adoptar'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Dar en adopcion'),
                  value: 2,
                ),
                // Agrega más opciones de menú si es necesario
              ];
            },
            onSelected: (value) {
              // Aquí puedes manejar la opción seleccionada del menú
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormAdopted()),
                );
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dar en adopcion',
            style: TextStyle(
              fontFamily: 'ZillaSlab',
              fontSize: 20,
              textBaseline: TextBaseline.alphabetic,
              height: 3,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(30),
              children: [
                SizedBox(height: 1),
                GestureDetector(
                  onTap: () {
                    // Aquí puedes agregar la redirección que deseas
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPets()),
                    );
                  },
                  child: ExpansionTile(
                    backgroundColor: Color(0xFF3C444D),
                    collapsedBackgroundColor: Color(0xFF3C444D),
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Agregar mascota',
                      style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Aquí puedes agregar una nueva tarjeta o contenido',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFFCBCFD4),
                            fontSize: 14,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

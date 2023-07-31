import 'package:flutter/material.dart';
import '../Widgets/adoption_card.dart';
import '../ApiService/Api_Service.dart';
import '../../../Adopt/Identification/Pages/FormAdopted.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> adoptionData = [];

  @override
  void initState() {
    super.initState();
    getDataFromBackend();
  }

  Future<void> getDataFromBackend() async {
    try {
      List<Map<String, String>> data = await ApiService.getDataFromBackend();

      setState(() {
        adoptionData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

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
              ];
            },
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              } else if (value == 2) {
                // Implementar la acción para "Dar en adopcion"
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormAdopted()));
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Catálogo de adopción',
              style: TextStyle(
                fontFamily: 'ZillaSlab',
                fontSize: 20,
                textBaseline: TextBaseline.alphabetic,
                height: 3,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: adoptionData.length,
              itemBuilder: (context, index) {
                Map<String, String> pet = adoptionData[index];
                return AdoptionCard(
                  imageUrl: pet['image'] ?? '',
                  title: pet['nombre'] ?? '',
                  description: pet['descripcion'] ?? '',
                  raza: pet['raza'] ?? '', // Asegúrate de agregar 'raza' aquí
                  horario: pet['horario'] ?? '',
                  ubicacion: pet['ubicacion'] ?? '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

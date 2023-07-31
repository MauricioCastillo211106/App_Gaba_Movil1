import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Adopt/Identification/ApiService/Api_Service.dart';
import 'dart:io';
import 'FormAdopted.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Utils/auth_manager.dart';
import '../../../Pets/Identification/Pages/HomePage.dart';

class AddPets extends StatefulWidget {
  const AddPets({Key? key}) : super(key: key);

  @override
  _AddPetsState createState() => _AddPetsState();
}

class _AddPetsState extends State<AddPets> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController razaController = TextEditingController();
  TextEditingController horarioController = TextEditingController();
  TextEditingController ubicacionController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  File? _image;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormAdopted()),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 304.0,
            child: Card(
              color: Color(0xFF3C444C),
              margin: EdgeInsets.all(20.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'NOMBRE',
                          style: TextStyle(
                            color: Color(0xFFCBCFD4),
                            fontSize: 10.0,
                            fontFamily: 'Montserrat',
                            height: 18.0 / 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: 275.0,
                      height: 40.0,
                      child: TextField(
                        controller: nombreController,
                        style: TextStyle(
                            color: nombreController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white),
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Text(
                          'RAZA',
                          style: TextStyle(
                            color: Color(0xFFCBCFD4),
                            fontSize: 10.0,
                            fontFamily: 'Montserrat',
                            height: 18.0 / 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: 275.0,
                      height: 40.0,
                      child: TextField(
                        controller: razaController,
                        style: TextStyle(
                            color: razaController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white),
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Raza',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    SizedBox(
                      width: 279.0,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: getImage,
                        icon: Icon(Icons.upload),
                        label: Text(_image != null
                            ? 'SUBIR IMAGEN'
                            : 'SUBIR IMAGEN'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          side: BorderSide(color: Colors.white, width: 1.0),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Text(
                          'HORARIO',
                          style: TextStyle(
                            color: Color(0xFFCBCFD4),
                            fontSize: 10.0,
                            fontFamily: 'Montserrat',
                            height: 18.0 / 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: 275.0,
                      height: 40.0,
                      child: TextField(
                        controller: horarioController,
                        style: TextStyle(
                            color: horarioController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white),
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Horario',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Text(
                          'UBICACION',
                          style: TextStyle(
                            color: Color(0xFFCBCFD4),
                            fontSize: 10.0,
                            fontFamily: 'Montserrat',
                            height: 18.0 / 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: 275.0,
                      height: 40.0,
                      child: TextField(
                        controller: ubicacionController,
                        style: TextStyle(
                            color: ubicacionController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white),
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Ubicación',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Text(
                          'DESCRIPCIÓN',
                          style: TextStyle(
                            color: Color(0xFFCBCFD4),
                            fontSize: 10.0,
                            fontFamily: 'Montserrat',
                            height: 18.0 / 10.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Container(
                      width: 275.0,
                      height: 100.0,
                      child: TextField(
                        controller: descripcionController,
                        maxLines: 5,
                        style: TextStyle(
                            color: descripcionController.text.isNotEmpty
                                ? Colors.black
                                : Colors.white),
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Descripción',
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    // Espacio entre el ExpansionTile y el botón "Dar en adopción"
                    // Botón de dar en adopción
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
                          ApiService.enviarDatosAlBackend(nombre: nombreController.text, raza: razaController.text, horario: horarioController.text, ubicacion: ubicacionController.text, descripcion: descripcionController.text, image: _image);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
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
                            Colors.transparent,
                          ),
                        ),
                        child: Text(
                          'Dar en adopción',
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

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);

    if (xFile != null) {
      File file = File(xFile.path);
      setState(() {
        _image = file;
      });
    } else {
      print('No se seleccionó ninguna imagen');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:crudjr/servicios/firebase_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController CantidadController = TextEditingController(text: "");
  TextEditingController PrecioController = TextEditingController(text: "");
  TextEditingController BodegAController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['Nombre'];
    nameController.text = arguments['Cantidad'];
    nameController.text = arguments['Precio'];
    nameController.text = arguments['bodega'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Productos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese la nueva modificacion de Producto'),
            ),
            TextField(
              controller: CantidadController,
              decoration: const InputDecoration(
                  hintText:
                      'Ingrese la nueva modificacion de Cantidad Producto'),
            ),
            TextField(
              controller: PrecioController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese la nueva modificacion de Precio Producto'),
            ),
            TextField(
              controller: BodegAController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese la nueva modificacion de BodegaProducto'),
            ),
            ElevatedButton(
                onPressed: (() async {
                  await addCRUD(nameController.text, CantidadController.text,
                          PrecioController.text, BodegAController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                }),
                child: const Text("Editar"))
          ],
        ),
      ),
    );
  }
}

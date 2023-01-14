import 'package:crudjr/servicios/firebase_service.dart';
import 'package:flutter/material.dart';

class AddPages extends StatefulWidget {
  const AddPages({super.key});

  @override
  State<AddPages> createState() => _AddPagesState();
}

class _AddPagesState extends State<AddPages> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController CantidadController = TextEditingController(text: "");
  TextEditingController PrecioController = TextEditingController(text: "");
  TextEditingController BodegAController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Productos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese el nuevo Producto'),
            ),
            TextField(
              controller: CantidadController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese el nueva Cantidad Producto'),
            ),
            TextField(
              controller: PrecioController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese el nuevo Precio Producto'),
            ),
            TextField(
              controller: BodegAController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese el nueva BodegaProducto'),
            ),
            ElevatedButton(
                onPressed: (() async {
                  await addCRUD(nameController.text, CantidadController.text,
                          PrecioController.text, BodegAController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                }),
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}

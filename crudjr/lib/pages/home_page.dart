import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crudjr/servicios/firebase_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: FutureBuilder(
        future: getCRUD(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]['Nombre']),
                    onTap: (() async {
                      await Navigator.pushNamed(
                        context,
                        "",
                        arguments: {
                          "Nombre": snapshot.data?[index]['Nombre'],
                          "Cantidad": snapshot.data?[index]['Cantidad'],
                          "Precio": snapshot.data?[index]['Precio'],
                          "bodega": snapshot.data?[index]['bodega'],
                          "uid": snapshot.data?[index]['uid'],
                        },
                      );
                      setState(() {});
                    }),
                  );
                }));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          await Navigator.pushNamed(context, "");
          setState(() {});
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<List> getCRUD() async {
  List crud = [];
  QuerySnapshot querySnapshot = await db.collection("productos").get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final crud = {
      "Nombre": data['name'],
      "Cantidad": data['catidad'],
      "Precio": data['precio'],
      "bodega": data['bodega'],
      "uid": doc.id,
    };
    crud.addAll(crud);
  }
  await Future.delayed(const Duration(seconds: 5));

  return crud;
}

// Guardar Base de datos
Future<void> addCRUD(
    String name, String cantidad, String precio, String bodega) async {
  await db.collection("productos").add({
    "Nombre": name,
    "Cantidad": cantidad,
    "Precio": precio,
    "bodega": bodega
  });
}

//Actualizar Base de datos
Future<void> updateCRUD(String newname, String newcantidad, String newprecio,
    String newbodega, String uid) async {
  await db.collection("productos").doc(uid).set({
    "Nombre": newname,
    "Cantidad": newcantidad,
    "Precio": newprecio,
    "bodega": newbodega
  });
}

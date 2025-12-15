import 'dart:io';
import 'package:flutter/material.dart';
import '../models/foto.dart';

class FotoItem extends StatelessWidget {
  final Foto foto;

  const FotoItem({Key? key, required this.foto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.file(
        File(foto.path), 
        width: 55, 
        fit: BoxFit.cover,
      ),
      title: Text(foto.nombre),
      subtitle: Text(foto.descripcion),
      
    );
  }
}
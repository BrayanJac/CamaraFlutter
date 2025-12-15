import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/foto.dart';
import '../providers/foto_provider.dart';

class FotoController {
  final FotoProvider provider;
  final ImagePicker picker = ImagePicker();

  //Constructor
  FotoController(this.provider);

  //Metodo para tomar la foto
  Future<void> tomarFoto(BuildContext context) async {
    final XFile? foto = await picker.pickImage(source: ImageSource.camera);

    //Si la foto No es NULL, se guarda
    if(foto != null){
      provider.agregarFoto(
        Foto(path: foto.path,
            nombre: "Foto ${provider.fotos.length + 1}",
            descripcion: "Foto tomada ....."
        ) 
      );

      //notificacion-snackbar
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(
          content: Text("Foto tomada correctamente"),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
          )
      );
    }
  }
}
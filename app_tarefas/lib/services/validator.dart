import 'dart:io';

import 'package:app_tarefas/models/task_model.dart';
import 'package:flutter/material.dart';

class Validator {
  static String? validatorNametask(String? value) {
    if (value != null && value.isEmpty) {
      return "Insira a Task";
    }
    return null;
  }

  static String? validatorUrl(String? value) {
    if (value!.isEmpty) {
      return "Insira a URL";
    }
    return null;
  }

  static String? validatorDificuldade(String? value) {
    if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
      return "Insira a Dificuldade";
    }
    return null;
  }

  static imagePathValid(File pic) {
    return pic.existsSync()
        ? FileImage(File(pic.path))
        : NetworkImage(
            "https://i.pinimg.com/564x/a1/1a/43/a11a43010541818bbcf77a41e830d575.jpg");
  }

  static saveValidator(BuildContext context, _formKey, nameController,
      dificuldadeController, imageController, descController, _dao) {
    if (_formKey.currentState!.validate() && imageController != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Tarefa salva")));
      Navigator.pop(context);

      final String nome = nameController;
      final File foto = imageController;
      final String desc = descController;
      final int dificuldade = int.parse(dificuldadeController);

      final TaskViewModel newContact =
          TaskViewModel(0, nome, dificuldade, foto.path, desc);
      _dao.save(newContact).then((id) => Navigator.of(context).maybePop());
    }
  }

  static casesIf(BuildContext context, nameController, dificuldadeController,
      imageController) {
    if (nameController.isEmpty &&
        dificuldadeController.isEmpty &&
        imageController == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Preencha os campos")));
    }
    if (nameController.isEmpty &&
        dificuldadeController.isNotEmpty &&
        imageController.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Preencha o campo Task")));
    }
    if (nameController.isNotEmpty &&
        dificuldadeController.isEmpty &&
        imageController.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campo Dificuldade")));
    }
    if (nameController.isNotEmpty &&
        dificuldadeController.isNotEmpty &&
        imageController == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Selecione uma Image")));
    }
    if (nameController.isNotEmpty &&
        dificuldadeController.isEmpty &&
        imageController == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
    if (nameController.isEmpty &&
        dificuldadeController.isNotEmpty &&
        imageController == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
    if (nameController.isEmpty &&
        dificuldadeController.isEmpty &&
        imageController != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
  }
}

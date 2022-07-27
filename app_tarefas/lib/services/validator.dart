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

  static casesIf(BuildContext context, nameController, dificuldadeController,
      imageController) {
    if (nameController.isEmpty &&
        dificuldadeController.isEmpty &&
        imageController.isEmpty) {
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
        imageController.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Preencha o campo Image")));
    }
    if (nameController.isNotEmpty &&
        dificuldadeController.isEmpty &&
        imageController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
    if (nameController.isEmpty &&
        dificuldadeController.isNotEmpty &&
        imageController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
    if (nameController.isEmpty &&
        dificuldadeController.isEmpty &&
        imageController.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Preencha o campos em vermelho")));
    }
  }
}

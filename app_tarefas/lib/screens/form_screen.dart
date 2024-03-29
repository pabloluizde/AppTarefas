import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/dao/task_dao.dart';
import '../services/validator.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TasksDao _dao = TasksDao();
  File? image;

  Future pickeImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Container(
              alignment: AlignmentDirectional.centerStart,
              child: const Text(
                "New Task",
                style: TextStyle(color: Colors.black),
              )),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        return Validator.validatorNametask(value);
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Nova Task",
                        labelText: "Task",
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        return Validator.validatorDificuldade(value);
                      },
                      keyboardType: TextInputType.number,
                      controller: dificuldadeController,
                      decoration: InputDecoration(
                        hintText: "Dificuldade",
                        labelText: "Dificuldade",
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      controller: descController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Descrição",
                        labelText: "Descrição",
                        labelStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {
                        pickeImage();
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: image != null ? Image.file(image!) : null,
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                        color: Colors.purpleAccent,
                        blurRadius: 7.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ], borderRadius: BorderRadius.circular(5.0)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purpleAccent,
                        ),
                        onPressed: () {
                          Validator.saveValidator(
                              context,
                              _formKey,
                              nameController.text,
                              dificuldadeController.text,
                              image,
                              descController.text,
                              _dao);
                          Validator.casesIf(context, nameController.text,
                              dificuldadeController.text, image);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.add),
                            Text(
                              "Create Task",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

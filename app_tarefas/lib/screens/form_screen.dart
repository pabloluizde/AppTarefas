import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text("New Task")),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
              child: TextFormField(
                controller: imageController,
                onChanged: (text) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Nova Imagem",
                  labelText: "Imagem",
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
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageController.text, errorBuilder:
                      (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                    return Container(
                      child: Icon(Icons.camera_alt_outlined),
                    );
                  }, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 45,
              width: 160,
              child: ElevatedButton(
                  onPressed: () {
                    print(nameController.text);
                    print(imageController.text);
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
      ),
    );
  }
}

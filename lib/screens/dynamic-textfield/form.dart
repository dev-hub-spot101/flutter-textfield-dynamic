import 'package:flutter/material.dart';

class TextFieldDynamicScreen extends StatefulWidget {
  const TextFieldDynamicScreen({super.key});

  @override
  State<TextFieldDynamicScreen> createState() => _TextFieldDynamicScreenState();
}

class _TextFieldDynamicScreenState extends State<TextFieldDynamicScreen> {
  List<TextEditingController> listController = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    listController.add(TextEditingController());
                  });

                  print(listController.length);
                },
                icon: Icon(
                  Icons.add_rounded,
                  size: 34,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  "Dynamic Text",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                shrinkWrap: true,
                itemCount: listController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xFF2E384E),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              controller: listController[index],
                              autofocus: false,
                              style: const TextStyle(color: Color(0xFFF8F8FF)),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Input text here",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 132, 140, 155))),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        index != 0
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    listController[index].clear();
                                    listController[index].dispose();
                                    listController.removeAt(index);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 34,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

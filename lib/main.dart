import 'package:flutter/material.dart';

void main() => runApp(const InputData());

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<InputData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  String nimMHS = '';
  String fullName = '';
  String waktuKuliah = "Pagi";
  bool checkBoxValue = false;

  Widget _inputFullName() {
    return Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Full Name",
          ),
          onChanged: (text) {
            setState(() {
              fullName = text;
            });
          },
        ));
  }

  Widget _inputNIM() {
    return Container(
        margin: const EdgeInsets.all(20),
        child: TextField(
          controller: nimController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nomor Induk Mahasiswa",
          ),
          onChanged: (text) {
            setState(() {
              nimMHS = text;
            });
          },
        ));
  }

  Widget _inputWaktuKuliah1() {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          const Text("Waktu Kuliah 1: "),
          Checkbox(
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                  if (checkBoxValue) {
                    waktuKuliah = "Sore";
                  } else {
                    waktuKuliah = "Pagi";
                  }
                });
              }),
          Text(waktuKuliah),
        ],
      ),
    );
  }

  Widget _inputWaktuKuliah() {
    return SizedBox(
      width: 630.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 10,
        child: Padding(
          // set jarak antara card dgn Column
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Align(
            alignment: Alignment.topLeft, // set posisi Colomn dalam Card
            child: Column(
              // Row
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text("Waktu Kuliah : "),
                Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        checkBoxValue = newValue;
                        if (checkBoxValue) {
                          waktuKuliah = "Sore";
                        } else {
                          waktuKuliah = "Pagi";
                        }
                      });
                    }),
                Text(waktuKuliah)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submit() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          print(nimMHS);
          print(fullName);
          if ((nimMHS.isEmpty) || (fullName.isEmpty)) {
            print("nim atau nama tidak boleh kosong");

            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Thanks!'),
                  content: const Text('nim atau nama tidak boleh kosong'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }

          ///end if
        },
        child: const Text('Submit'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Input Data Mahasiswa'),
          ),
          body: Column(children: <Widget>[
            _inputNIM(),
            _inputFullName(),
            _inputWaktuKuliah(),
            _submit(),
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(fullName),
            ),
          ]),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Close', // used by assistive technologies
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          )),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Belajar Form Flutter",
    home: BelajarForm(),
  ));
}

class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  double nilaiSlider = 1;
  bool nilaiChekbox = false;
  bool nilaiSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Form Flutter"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "Contoh: Muh Farizul Imami S",
                  labelText: "Nama Lengkap",
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.security),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              CheckboxListTile(
                title: Text("Belajara Dasar Flutter"),
                subtitle: Text("Dart, widget, http"),
                value: nilaiChekbox,
                activeColor: Colors.deepPurpleAccent,
                onChanged: (value) {
                  setState(() {
                    nilaiChekbox = value!;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Backend Programming"),
                subtitle: Text("Dart, NodeJs, PHP, Java, dll"),
                value: nilaiSwitch,
                activeTrackColor: Colors.pink[100],
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    nilaiSwitch = value;
                  });
                },
              ),
              Slider(
                value: nilaiSlider,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    nilaiSlider = value;
                  });
                },
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

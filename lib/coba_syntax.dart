import 'package:flutter/material.dart';

class CobaSyntax extends StatefulWidget {
  const CobaSyntax({Key? key}) : super(key: key);

  @override
  State<CobaSyntax> createState() => _CobaSyntaxState();
}

class _CobaSyntaxState extends State<CobaSyntax> {
  bool isChecked = false;
  bool isActive = false;

  DateTime nowDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    DateTime? select = await showDatePicker(
      context: context,
      initialDate: nowDate,
      firstDate: DateTime(1970),
      lastDate: nowDate,
    );

    if (select != null && select != nowDate) {
      setState(() {
        nowDate = select;
      });
    }
  }

  TimeOfDay nowHour = TimeOfDay.now();
  Future<Null> _selectHour(BuildContext context) async {
    TimeOfDay? selectHour =
        await showTimePicker(context: context, initialTime: nowHour);

    if (selectHour != null && selectHour != nowHour) {
      setState(() {
        nowHour = selectHour;
      });
    }
  }

  List<String> _listOfMonth = ["Jan", "Feb", "Mar"];
  String? monthValue = "";
  @override
  void initState() {
    monthValue = _listOfMonth.first;
    super.initState();
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Muncul euy"),
            content: Text("Bulan yang dipilih $monthValue"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();

    return SingleChildScrollView(
        child: Container(
            width: 600,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 0),
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukan username";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukan Password";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "No. Telp",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukan Nomer Telepon";
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CheckboxListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        title: const Text("Sudah dewasa"),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              isChecked = value;
                            }
                          });
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: SwitchListTile(
                      title: const Text("Masih Aktif"),
                      contentPadding: const EdgeInsets.all(0),
                      value: isActive,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            isActive = value;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: OutlinedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(300, 40),
                      ),
                      child: Text(
                        "Tanggal: ${nowDate.day}-${nowDate.month}-${nowDate.year}",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      child: Text(
                          "Jam: ${nowHour.hour}:${nowHour.minute}:${nowDate.second}"),
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(300, 40),
                      ),
                      onPressed: () {
                        _selectHour(context);
                      },
                    ),
                  ),
                  DropdownButton(
                      underline: Container(
                        width: 400,
                        height: 35,
                      ),
                      elevation: 16,
                      value: monthValue,
                      onChanged: (String? value) {
                        setState(() {
                          monthValue = value;
                        });
                      },
                      items: _listOfMonth
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                  TextButton(
                      onPressed: () {
                        _showAlert(context);
                      },
                      child: Text("Show Alert")),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _formkey.currentState?.validate();
                      },
                      child: const Text("Simpan"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade400,
                          minimumSize: Size(500, 40)),
                    ),
                  )
                ],
              ),
            )));
  }
}

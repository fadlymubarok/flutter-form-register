import 'package:flutter/material.dart';
import 'detail.dart';
import 'model/sign_up_model.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  final SignUpModel _userInfo = SignUpModel();
  final List<String> _listGender = ['Laki-laki', 'Perempuan', 'Other'];
  final List<String> _listCity = ['Bogor', 'Bekasi', 'Bandung'];
  final List<String> _listProvince = ['Jawa barat', 'Jakarta', 'Banten'];

  void _submit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Information"),
            content: Text("Data Saved !"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  data: _userInfo,
                                  title: "Account Detail",
                                )));
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: Text("Detail", style: TextStyle(color: Colors.black))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  child: Text("Close", style: TextStyle(color: Colors.black)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red.shade200,
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const Text(
              "User Info",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "User Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Masukan Username";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    _userInfo.username = value;
                  });
                },
              ),
            ),
            Container(
              width: 400,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                obscureText: true,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Masukan Password";
                //   } else if (value.length < 8) {
                //     return "Password minimal 8";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    _userInfo.password = value;
                  });
                },
              ),
            ),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                keyboardType: TextInputType.emailAddress,
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Masukan Email";
                //   } else if (!value.contains('@')) {
                //     return "Email tidak valid";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    _userInfo.email = value;
                  });
                },
              ),
            ),
            const Text("Address Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )),
            Container(
              width: 400,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return "Masukan Alamat";
                //   }
                // },
                onChanged: (value) {
                  _userInfo.address = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    label: const Text("City"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                items: _listCity.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                // validator: (value) {
                //   if (value == null) {
                //     return "Pilih city";
                //   }
                // },
                onChanged: (value) {
                  setState(() {
                    _userInfo.city = value.toString();
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  label: Text("Province"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                items:
                    _listProvince.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                // validator: (value) {
                //   if (value == null) {
                //     return "Pilih province";
                //   }
                // },
                onChanged: (value) => setState(() {
                  _userInfo.province = value.toString();
                }),
              ),
            ),
            const Text("More Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                items:
                    _listGender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return "Pilih gender";
                  }
                },
                onChanged: (value) => setState(() {
                  _userInfo.gender = value.toString();
                }),
              ),
            ),
            const Text("Hobby"),
            CheckboxListTile(
                title: const Text("Hobby 1"),
                value: _userInfo.hobby1,
                onChanged: (value) {
                  setState(() {
                    _userInfo.hobby1 = value!;
                  });
                }),
            CheckboxListTile(
                title: const Text("Hobby 2"),
                value: _userInfo.hobby2,
                onChanged: (value) {
                  setState(() {
                    _userInfo.hobby2 = value!;
                  });
                }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
          onPressed: () {
            if (formkey.currentState!.validate()) {
              _submit(context);
            }
          },
          child: const Text("Save",
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

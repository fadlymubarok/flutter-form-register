import 'package:flutter/material.dart';
import 'model/sign_up_model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.data, required this.title})
      : super(key: key);

  SignUpModel data;
  String title;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_sharp,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Colors.red.shade200,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Username: ${widget.data.username}"),
                Text("Gender: ${widget.data.gender}"),
                Text("Email: ${widget.data.email}"),
                Text("Address: ${widget.data.address}"),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("City: ${widget.data.city}"),
                Text("Province: ${widget.data.province}"),
                Text("Hobby 1: ${widget.data.hobby1}"),
                Text("Hobby 2: ${widget.data.hobby2}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

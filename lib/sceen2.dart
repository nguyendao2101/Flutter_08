import 'package:flutter/material.dart';
import 'package:test_case1/images/images_entension.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key, required this.nameFromSceen1}) : super(key: key);
  final String nameFromSceen1;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController user1 = TextEditingController();
  TextEditingController user2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Map<String, String>> productList = [];

  void clearTextFields() {
    user1.clear();
    user2.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('Danh sach the'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image.asset(ImageAssest.imageCard),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Thêm The'),
                            content: Column(
                              children: [
                                TextField(
                                  controller: user1,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    labelText: 'Card No',
                                  ),
                                ),
                                SizedBox(height: 20,),
                                TextField(
                                  controller: user2,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    labelText: 'Full Name',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Hủy'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (user1.text.isNotEmpty &&
                                      user2.text.isNotEmpty) {
                                    setState(() {
                                      productList.add({
                                        'name': user1.text,
                                        'quantity': user2.text,
                                      });
                                    });
                                    clearTextFields();
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Thêm'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Thêm thẻ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Danh sach cua techmaster',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                // Sử dụng ListView.builder lướt ngang
                Container(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200.0,
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageAssest.imageCard),
                            SizedBox(height: 8.0),
                            Text(
                              'Card No: ${productList[index]['name']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              'Full Name: ${productList[index]['quantity']}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
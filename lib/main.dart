import 'package:flutter/material.dart';
import 'package:test_case1/images/images_entension.dart';
import 'package:test_case1/sceen2.dart';
import 'package:test_case1/sceen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello TechMaster'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TextEditingController _user1;
  late TextEditingController _user2;

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _user1 = TextEditingController();
    _user2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: Image.asset(ImageAssest.techMasterCard),
                  ),
                ),
                TextFormField(
                  controller: _user1,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  onChanged: (username) {
                    _formKey.currentState?.validate();
                  },
                  validator: (username){
                    if((username??'').isEmpty){
                      return 'Username không được để trống';
                    } else if((username??'').contains(' ')){
                      return 'Uername không được có dấu cách';
                    } else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _user2,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                  ),
                  onChanged: (Password) {
                    _formKey.currentState?.validate();
                  },
                  validator: (password){
                    if((password??'').isEmpty){
                      return 'Password không được để trống';
                    }  else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20,),
                Container(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState?.validate()??false){
                          print('valid data');
                          if((_user1.text != 'nguyendao')||(_user2.text != '123456' )){
                            showDialog(context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Thông tin đăng nhập không đúng, vui lòng nhập lại'),
                                        SizedBox(height: 15,),
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text('Close'),),
                                      ],
                                    ),
                                  ),
                                ),);
                          }
                          if((_user1.text == 'nguyendao')&&(_user2.text == '123456' )){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Sceen3()));
                          }
                        }
                      },
                      child: Text('Sign In'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

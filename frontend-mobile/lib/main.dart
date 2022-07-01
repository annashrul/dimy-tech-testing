import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/homeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }
  final TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)
                ),
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Pin',
                      labelText: 'Enter Pin'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){

                  if(controller.text==""){
                    showInSnackBar("Pin tidak boleh kosong");
                    return;
                  }
                  if(controller.text=='2022'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                  }
                  else{
                    showInSnackBar("Pin yang anda masukan salah");
                  }
                },
                child: Container(
                    padding: EdgeInsets.all(20.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text("LOGIN",style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    )
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/SampleModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SampleModel sampleModel;
  bool isLoading=true;
  List data=[];
  Future loadData()async{
    final String postsURL = "https://api.sampleapis.com/coffee/hot";
    final response  = await get(postsURL);
    if(response .statusCode==200){
      final jsonResponse = json.decode(response .body);

      data.addAll(jsonResponse);
      // SampleModel result = SampleModel.fromJson(jsonResponse);
      // sampleModel = result;
      isLoading=false;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    print(data);
    String deskripsi="";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("HOME"),
      ),
      body: isLoading?Center(child: CircularProgressIndicator()):ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
            Widget child;
            // if(data[i]["description"].length>100){
              deskripsi = data[i]["description"];
            // }
            return Card(
              child: ListTile(
                //leading: Icon(Icons.music_note),
                title: Container(
                  margin: EdgeInsets.only(top:10.0,bottom: 10.0),
                  child: Text(data[i]["title"]),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deskripsi,
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: List.generate(data[i]['ingredients'].length, (index) => Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: index==0?0:5),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            child: Text(data[i]['ingredients'][index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              elevation: 8,
              margin: EdgeInsets.all(20),
            );
          }
      ),

    );

  }
}

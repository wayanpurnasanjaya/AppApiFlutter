import 'package:flutter/material.dart';
import 'package:appapiflutter/model/model_user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:appapiflutter/ui_view/detail_list_user.dart';

class PageUserList extends StatefulWidget {
  const PageUserList({Key? key}) : super(key: key);

  @override
  State<PageUserList> createState() => _PageUserListState();
}

class _PageUserListState extends State<PageUserList> {
  List<Datum> listModel = [];
  bool loading = false;

  Future<ModelUsers?> getDataUser() async {
    setState((){
      loading = true;
    });
    final responseData = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(responseData.statusCode == 200){
      List<Datum> dataIjin = modelUsersFromJson(responseData.body).data;
      setState((){
        listModel = dataIjin;
        loading = false;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page User List"),
      ),
      body: Container(
        child: loading ? Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount:listModel.length ,
          itemBuilder: (context, i){
            final nDataList = listModel[i];

            return Container(

              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),

              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(
                    builder:(_) => DetaiListUser(nDataList)
                  ));
                },
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.green,
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(children: [Image.network(nDataList.avatar),],),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SizedBox(height: 5,),
                                Text(nDataList.id.toString(),style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                                SizedBox(height: 5,),
                              Text(nDataList.firstName + "" + nDataList.lastName, style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),
                                SizedBox(height: 5,),
                              Text(nDataList.email, style: TextStyle(color:Colors.white),textAlign: TextAlign.start,),
                            ],),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),


            );
          },
        ),
      ),
    );
  }
}

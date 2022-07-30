import 'package:flutter/material.dart';
import 'package:appapiflutter/model/model_user.dart';
import 'package:appapiflutter/main.dart';
import 'package:appapiflutter/ui_view/page_list_user.dart';

class DetaiListUser extends StatelessWidget {

  final Datum user;
  DetaiListUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(

          child: Column(

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user.email,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green),
                  ),
                  Text(user.firstName),
                  Text(user.lastName),
                  Image.network(user.avatar),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


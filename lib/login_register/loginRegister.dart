// import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/constant/constant.dart';
import 'package:ezara3_1/login_register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_bottom_navigation_bar.dart';
import 'login.dart';

class login_register extends StatefulWidget {
  @override
  _login_registerState createState() => _login_registerState();
}

class _login_registerState extends State<login_register> {
  @override
  Widget build(BuildContext context) {
    const IconData facebook_icon =
        IconData(0xe255, fontFamily: 'MaterialIcons');
    var form_key = GlobalKey<FormState>();
    var email_controller = TextEditingController();
    var password_controller = TextEditingController();
    var first_name_controller = TextEditingController();
    var last_name_controller = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80.0,
          ),
          Center(
            child: Text(
              'Lavie',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TabBar(
                        indicatorColor: color,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Text('Sign up'),
                          Text("Login"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key: form_key,
                      child: Container(
                        height: 400.0,
                        child: TabBarView(
                          children: <Widget>[
                            //Sign up form
                            Expanded(child: register()),
                            //login form
                           login(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

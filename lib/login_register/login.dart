import 'dart:convert';
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/login_register/loginCubit/loginCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'home_bottom_navigation_bar.dart';
import 'loginCubit/loginStates.dart';

// else  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Black ")));
// }

var email_controller = TextEditingController();
var password_controller = TextEditingController();

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var form_key = GlobalKey<FormState>();
    Future<void> loginValidation(screen) async {
      if (password_controller.text.isNotEmpty &&
          email_controller.text.isNotEmpty) {
        var response = await http.post(
            Uri.parse(
                "https://lavie.orangedigitalcenteregypt.com/api/v1/auth/signin"),
            body: ({
              'email': email_controller.text,
              'password': password_controller.text,
            }));
        print('date sent');
        if (response.statusCode == 200) {
          print('navigate to');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return screen;
          }));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Data")));
        }
      } else
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Black ")));
    }

    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (BuildContext context, state) {
        if (state is SignInSuccessState) {
          // if(state.plantLoginModel.type=='success')
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BottomNavigationBarScreen();
            }));
            print("success");
          }
        }
      },
      builder: (BuildContext context, Object? state) => Form(
        key: form_key,
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),

              Text('Email'),
              SizedBox(
                height: 2.0,
              ),
              //Email text form field

              Container(
                width: double.infinity,
                height: 40.0,
                child: defaulTextFormField(
                  isShown: false,
                  controller: email_controller,
                  valid: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Text('Password'),
              SizedBox(
                height: 2.0,
              ),
              //password text form field
              Container(
                width: double.infinity,
                height: 40.0,
                child: defaulTextFormField(
                  controller: password_controller,
                  valid: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ConditionalBuilder(
                condition: state is! SignInLoadingState,
                builder: (BuildContext context) => defaultButton(
                  onPress: () {
                    if (form_key.currentState!.validate()) {
                      SignInCubit.get(context).userLogin(
                          email: email_controller.text,
                          password: password_controller.text);

                      // loginValidation(bottom_navigation_bar());
                    }
                  },
                  buttonName: "Login",
                  color: Colors.green,
                ),
                fallback: (BuildContext context) {
                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              //coninue with  text
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      // width: ,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' or continue with ',
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              //facebook icon
              Center(
                  child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.facebook_rounded),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:html';
import 'dart:io';

import 'package:ezara3_1/API/signUpData.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/login_register/home_bottom_navigation_bar.dart';
import 'package:ezara3_1/login_register/registerCubit/registerCubit.dart';
import 'package:ezara3_1/login_register/registerCubit/registerStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    var form_key = GlobalKey<FormState>();
    var email_controller = TextEditingController();
    var password_controller = TextEditingController();
    var first_name_controller = TextEditingController();
    var last_name_controller = TextEditingController();
var cubit = BlocProvider.of<RegisterCubit>(context,listen: true);
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (BuildContext context, state) {
       if(state is RegisterSuccessState){
         Navigator.push(context,
             MaterialPageRoute(
                 builder: (context) {
                   return BottomNavigationBarScreen();
                 }));
       }
      },
      builder: (BuildContext context, Object? state) =>Form(
        key: form_key,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text('First Name'),
              SizedBox(
                height: 2.0,
              ),
              //First name text form field
              Container(
                width: double.infinity,
                height: 40.0,
                child: defaulTextFormField(
                  isShown: false,
                  controller: first_name_controller,
                  valid: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name must not be empty';
                    }
                    return null;
                  },
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Last Name'),
              SizedBox(
                height: 2.0,
              ),
              //Last name text form field
              Container(
                width: double.infinity,
                height: 40.0,
                child: defaulTextFormField(
                  isShown: false,
                  controller: last_name_controller,
                  valid: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name must not be empty';
                    }
                    return null;
                  },
                  radius: 5,
                ),
              ),
              SizedBox(
                height: 20.0,
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
              //Password text form field
              Container(
                width: double.infinity,
                height: 40.0,
                child: defaulTextFormField(
                  isShown: false,
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
              defaultButton(
                onPress: () async{
                  // print('kareem');
                  if   (form_key.currentState!.validate()){

                    print('Logiiiiiiiiiiiiiiiiin');
                    cubit.userLogin(email: email_controller.text, password: password_controller.text,lastName: last_name_controller.text,firstName: first_name_controller.text);
                  }
                },
                buttonName: "Register",
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),


    );
  }
}

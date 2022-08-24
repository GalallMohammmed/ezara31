import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ezara3_1/API/signUpData.dart';
import 'package:ezara3_1/login_register/loginCubit/loginStates.dart';
import 'package:ezara3_1/network/remote/dioHelper.dart';
import 'package:ezara3_1/network/remote/endPoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit <SignInStates>{
  SignInCubit():super( SignInInitialState()) ;
  static SignInCubit get(context)=>BlocProvider.of(context);

  void userLogin({required String email,required String password}){
    PlantLoginModel plantLoginModel;
    emit(SignInLoadingState());
    DioHelper.postData(url: LOGIN, data:{
      'email':email,
      'password':password,
    }).then((value){
      //pass data
      // plantLoginModel= PlantLoginModel.fromJson(value.data);
      // print(plantLoginModel.type);
      // print(plantLoginModel.message);
      // print(plantLoginModel.data.firstName);
      emit(SignInSuccessState());
    }).catchError((error){
      if (error is DioError){
       print(error.response!.data['message']);
      }
      print(error.toString());
      emit(SignInErrorState(error.toString()));
    });
  }
}
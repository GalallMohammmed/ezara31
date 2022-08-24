import 'package:bloc/bloc.dart';
import 'package:ezara3_1/API/signUpData.dart';
import 'package:ezara3_1/login_register/loginCubit/loginStates.dart';
import 'package:ezara3_1/login_register/registerCubit/registerStates.dart';
import 'package:ezara3_1/network/remote/dioHelper.dart';
import 'package:ezara3_1/network/remote/endPoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit <RegisterStates>{
  RegisterCubit():super( RegisterInitialState()) ;

  static RegisterCubit get(context)=>BlocProvider.of(context);
  PlantLoginModel? plantLoginModel;

  void userLogin({required String email,required String password,required String firstName,required String lastName}){
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, data:{
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'password':password,
    }).then((value){
      print(value.data);
      // plantLoginModel= PlantLoginModel.fromJson(value.data);
      // print(plantLoginModel!.type);
      // print(plantLoginModel!.message);
      // print(plantLoginModel!.data.firstName);
      emit(RegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}
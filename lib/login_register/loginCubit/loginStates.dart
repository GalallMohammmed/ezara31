import 'package:ezara3_1/API/signUpData.dart';

abstract class  SignInStates{}

class SignInInitialState extends SignInStates{}
class SignInLoadingState extends SignInStates{}
class SignInSuccessState extends SignInStates{
  // final  PlantLoginModel plantLoginModel;

  SignInSuccessState();
}
class SignInErrorState extends SignInStates{
  final String error;
  SignInErrorState(this.error);
}
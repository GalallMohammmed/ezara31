import 'package:bloc/bloc.dart';
import 'package:ezara3_1/API/productsData.dart';
import 'package:ezara3_1/Cubit/states.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/network/remote/dioHelper.dart';
import 'package:ezara3_1/network/remote/endPoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetCubit extends Cubit<PlanetStates>{
  PlanetCubit() : super(initialstate());
  static PlanetCubit get(context) => BlocProvider.of<PlanetCubit>(context);
  bool cartIsEmpty=true;
  bool searchIsEmpty=true;
  int counter=1;
  void minus(){
    counter--;
    emit(minus_state(counter));
  }
  void plus(){
    counter++;
    emit(plus_state(counter));
  }
List<Data> plant=[];
  List<Data> seed=[];
  List<Data> tool=[];

  Products? productsData;
  void getProductsData(){

    emit(ProductsLoadingState());
    DioHelper.getData(url: PRODUCTS).then((value){
      productsData=Products.fromJson(value.data);
      for (var item in productsData!.data!) {
        if (item.plant != null) {
          if (!plant.contains(item)) {
            plant.add(item);
          }
        } else if (item.seed != null) {
          if (!seed.contains(item)) {
            seed.add(item);
          }
        } else {
          if (!tool.contains(item)) {
            tool.add(item);
          }
        }
      }
      // print(productsData);
      emit(ProductsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(ProductsErrorState(error));
    });
  }


  // List<dynamic> business1 = [];
  // void getSignUp() {
  //   emit(SignUpLoadingState());
  //   if (business1.length == 0) {
  //     diohelper.getdata(url: 'v2/top-headlines', query: {
  //       'country': 'eg',
  //       'category': 'business',
  //       'apikey': 'd5ec87b167e74fb2a8f7687eb0b0d798',
  //     }).then((value) {
  //       // print(value.data['totalResults']);
  //       business1 = value.data['articles'];
  //       print(business1[0]);
  //       emit(SignUpSuccessState());
  //     }).catchError((erorr) {
  //       print(erorr.toString());
  //       emit(SignUpErrorState(erorr.toString()));
  //     });
  //   }
  // }
}
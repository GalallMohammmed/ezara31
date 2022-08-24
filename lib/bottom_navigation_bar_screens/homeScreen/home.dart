// import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:ezara3_1/API/productsData.dart';
import 'package:ezara3_1/Cubit/cubit.dart';
import 'package:ezara3_1/Cubit/states.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/Search/search.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/profile.dart';
import 'package:ezara3_1/constant/constant.dart';
import 'package:ezara3_1/layout/cart.dart';
import 'package:ezara3_1/layout/grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class home_screen extends StatefulWidget {


  @override
  _home_screenState createState() => _home_screenState();
}
List<bool>colorFlag=[
  true,
  false,
  false,
  false,
];
class _home_screenState extends State<home_screen> {
  var searchController=TextEditingController();
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    List list_of_category=[
      Expanded(
        child: TextButton(
          onPressed: () {
            setState(() {
              colorFlag[0]=true;
              colorFlag[1]=false;
              colorFlag[2]=false;
              colorFlag[3]=false;
              // color_flag=true;
            });
          },
          child: Container(
            width: double.infinity,
            decoration:BoxDecoration(
              color: colorFlag[0]?Colors.white: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color:colorFlag[0]?color: Colors.grey.shade200
              ),
              // border: BoxBorder()
            ),
            child: Center(
              child: Text("All",
                style: TextStyle(
                  color:colorFlag[0]?color: Colors.grey, ),),
            ),

          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {

            setState(() {
              griedview();
              currentIndex=0;
              colorFlag[0]=false;
              colorFlag[1]=true;
              colorFlag[2]=false;
              colorFlag[3]=false;
              // color_flag=true;
            });
          },
          child: Container(
            width: double.infinity,
            decoration:BoxDecoration(
              color: colorFlag[1]?Colors.white: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  color:colorFlag[1]?color: Colors.grey.shade200,
              ),
              // border: BoxBorder()
            ),
            child: Center(
              child: Text("Plants",
                style: TextStyle(
                  color:colorFlag[1]?color: Colors.grey, ),),
            ),

          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {
            setState(() {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return griedview();
              }));
              // current_index=0;
              colorFlag[0]=false;
              colorFlag[1]=false;
              colorFlag[2]=true;
              colorFlag[3]=false;
              // color_flag=true;
            });
          },
          child: Container(
            width: double.infinity,
            decoration:BoxDecoration(
              color: colorFlag[2]?Colors.white: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  color:colorFlag[2]?color: Colors.grey.shade200
              ),
              // border: BoxBorder()
            ),
            child: Center(
              child: Text("Seeds",
                style: TextStyle(
                  color:colorFlag[2]?color: Colors.grey, ),),
            ),

          ),
        ),
      ),
      Expanded(
        child: TextButton(
          onPressed: () {
            setState(() {
              // current_index=0;
              // color_flag=true;
              colorFlag[0]=false;
              colorFlag[1]=false;
              colorFlag[2]=false;
              colorFlag[3]=true;
            });
          },
          child: Container(
            width: double.infinity,
            decoration:BoxDecoration(
              color: colorFlag[3]?Colors.white: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  color:colorFlag[3]?color: Colors.grey.shade200
              ),
              // border: BoxBorder()
            ),
            child: Center(
              child: Text("Tools",
                style: TextStyle(
                  color:colorFlag[3]?color: Colors.grey, ),),
            ),

          ),
        ),
      ),

    ];

    return BlocConsumer<PlanetCubit,PlanetStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)=> ConditionalBuilder(
        condition: true, // PlanetCubit.get(context).productsData!=null,
        fallback: (BuildContext context)=>Center(child: CircularProgressIndicator()),
        builder: (BuildContext context) =>Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Container(
                      width: double.infinity,
                      // color: Colors.white,
                      // height: 40.0,
                      child: Image.asset("assets/images/splash1234.JPG",
                        height: 100.0,
                        // color: Colors.white,
                        width: double.infinity,
                      )),

                  SizedBox(width: 20.0),

                  Row(
                    children: [
                      //search button
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return search();
                            })) ;
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40.0,

                            decoration:BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5.0),

                            ),
                            //search space
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10.0,),
                                Icon(Icons.search,
                                  color: Colors.grey,),
                                SizedBox(width: 5.0,),
                                Text("Search",style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0,
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      //my cart button
                      TextButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return PlanetCubit.get(context).cartIsEmpty?CartEmpty() :cart_list();
                        })) ;
                      }, child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration:BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(5.0),

                        ),
                        child: Icon(Icons.shopping_cart_outlined,
                          color: Colors.white,),
                      )),
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Row(
                    children: [
                      list_of_category[0],
                      SizedBox(width: 5.0,),
                      list_of_category[1],
                      SizedBox(width: 5.0,),
                      list_of_category[2],
                      SizedBox(width: 5.0,),
                      list_of_category[3],
                      SizedBox(width: 5.0,),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}


class GridViewData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlanetCubit,PlanetStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          condition:state is ProductsLoadingState ,
          fallback: (BuildContext context) => dataToGridView(PlanetCubit.get(context).productsData,context),
          builder: (BuildContext context) =>Center(child: CircularProgressIndicator()));
      }
    );
  }
}
Widget dataToGridView(Products? productsData,context){
  var cubit=PlanetCubit.get(context);
  return SingleChildScrollView(
    child: Column(

      children: [
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,

          scrollDirection: Axis.vertical,
          children: List.generate(cubit.plant.length
              ,
                  (index) => Column(
                    children: [

                      Image(image: NetworkImage(cubit.productsData!.data![index].plant!.imageUrl!),width: double.infinity,),
                    ],
                  ) ),
        )
      ],
    ),
  );
}

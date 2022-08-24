import 'package:ezara3_1/Cubit/cubit.dart';
import 'package:ezara3_1/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var searchController= TextEditingController();
class search extends StatelessWidget {
  final globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 40.0,),
              TextFormField(
                controller: searchController,
                onChanged: (value){
                  // newscubit.get(context).getsearch(value);
                  // searchController=value as TextEditingController;
                },
                decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon: Icon(Icons.wrap_text),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator:(value){
                  if(value==null||value.isEmpty){
                    return 'Search must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0,),
              Row(
                children: [
                  Text("Result For "),
                  Text('"Cactus "',style: TextStyle(
                    color: color,
                  ),),
                  Spacer(),
                  PlanetCubit.get(context).searchIsEmpty?Text("0 found",style: TextStyle(color: color),)
                      : Text("10 found",style: TextStyle(
                    color: color,
                  ),),
                ],
              ),
              SizedBox(height: 40.0,),
             PlanetCubit.get(context).searchIsEmpty? Expanded(child:
             Image.asset("assets/images/cart.jpeg",
               width: double.infinity,
               fit: BoxFit.fill,)):Text("List of search"),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ezara3_1/Cubit/cubit.dart';
import 'package:ezara3_1/Cubit/states.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/Search/search.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/homeScreen/home.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/notification.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/plant.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/profile.dart';
import 'package:ezara3_1/bottom_navigation_bar_screens/qr_code.dart';
import 'package:ezara3_1/constant/constant.dart';
import 'package:ezara3_1/layout/cart.dart';
import 'package:ezara3_1/layout/grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  _BottomNavigationBarScreenState createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {


    List<bool>colorFlag=[
      false,
      false,
      false,
      false,
      false,
    ];
    int index=1;
    List<Widget>navigation_bar_items=[
      Icon(Icons.ac_unit,color: colorFlag[index]?Colors.white:Colors.black,),
      Icon(Icons.qr_code_scanner,color:colorFlag[index]?Colors.white:Colors.black),
      Icon(Icons.home_outlined,color: colorFlag[index]?Colors.white:Colors.black,),
      Icon(Icons.notifications_none,color:colorFlag[index]?Colors.white:Colors.black,),
      Icon(Icons.person_outline,color: colorFlag[index]?Colors.white:Colors.black,),
    ];
    List<Widget> screens = [
      plant_screen(),
      qr_code_screen(),
      home_screen(),
      notification_screen(),
      profile_screen()
    ];

    return BlocConsumer<PlanetCubit,PlanetStates>(
     listener: (BuildContext context, Object state){},
      builder: (BuildContext context, Object state)=>Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index:index,

          color: Colors.white,
          backgroundColor:Colors.grey.shade50,
          onTap: (value){
            setState(() {
              colorFlag[index]=false;
              colorFlag[value]=true;
              index=value;
              // value=index;
              print(index);
              print(value);

            });

          },
          buttonBackgroundColor: color,
          items:navigation_bar_items,),
        body:screens[index],
      ),
    );

  }
}

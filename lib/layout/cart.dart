import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cart_list extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle:true ,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text("My Cart",style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        )),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("My Cart",style: TextStyle(
            //   fontSize: 30.0,
            //   fontWeight: FontWeight.w600,
            // ),)
          ],
        ),
      ),
    );
  }
}
class CartEmpty extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0,),
            Text("My Cart",style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 40.0,),
            Expanded(child: Image.asset("assets/images/cart.jpeg",fit: BoxFit.fill,width: double.infinity,)),
          ],
        ),
      ),
    );
  }
}
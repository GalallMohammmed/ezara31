import 'package:ezara3_1/Cubit/cubit.dart';
import 'package:ezara3_1/Cubit/states.dart';
import 'package:ezara3_1/Rusable/reusable.dart';
import 'package:ezara3_1/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

////////////////use post  /api/v1/products
Widget grid(String product_name, String url, int price) {
  return BlocConsumer<PlanetCubit, PlanetStates>(
    listener: (BuildContext context, Object state) {},
    builder: (BuildContext context, state) {
      var cubit = PlanetCubit.get(context);
      print("data called");
      return Stack(
        children: [
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(image:NetworkImage(url), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Image"),
                      SizedBox(width: 10.0,),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,

                          borderRadius: BorderRadius.circular(5.0),
                          // border: BoxBorder()
                        ),
                        child: TextButton(
                            onPressed: () {
                              cubit.minus();
                            },
                            child: Center(child: Text("- "))),
                      ),
                      Text(" ${cubit.counter} "),
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5.0),
                          // border: BoxBorder()
                        ),
                        child: TextButton(
                            onPressed: () {
                              cubit.plus();
                            },
                            child: Center(child: Text(" + "))),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    product_name,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    "${price} EGP",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                  defaultButton(
                    onPress: (){},
                    buttonName: "Add To Cart",
                    color: color,
                    radius: 10.0,
                  ),
                ],
              ),
            ),
          ),

          //price


          // Positioned(
          //   top: 20,
          //   right: 50,
          //   // right: 8,
          //   child: Row(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade200,
          //           borderRadius: BorderRadius.circular(5.0),
          //           // border: BoxBorder()
          //         ),
          //         child: TextButton(
          //             onPressed: () {
          //               cubit.minus();
          //             },
          //             child: Center(child: Text("- "))),
          //       ),
          //       Text("${cubit.counter}"),
          //       Container(
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade200,
          //           borderRadius: BorderRadius.circular(5.0),
          //           // border: BoxBorder()
          //         ),
          //         child: TextButton(
          //             onPressed: () {
          //               cubit.plus();
          //             },
          //             child: Center(child: Text(" + "))),
          //       ),
          //     ],
          //   ),
          //
          //   // default_button(onpress: (){}, button_name:"Add To Cart",
          //   //   color: color,
          //   //   radius: 10.0,
          //   // ),
          // ),
        ],
      );
    },
  );
}

class griedview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=PlanetCubit.get(context);
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child:

      GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,  // بتحدد عدد الايتم اللى عايزها
      childAspectRatio: 1/1, // نسبه عرض الايتم كام لكام
    )
    ,itemCount:cubit.plant.length,
    itemBuilder: (context , index) {
    print("get product data");

    return grid(cubit.plant[index].name!,cubit.plant[index].imageUrl!,
        cubit.plant[index].price!);  // استخدمت انونماس فانكشن ومررتلو الداتا
    }          )


        // GridView.count(
        //   shrinkWrap: true,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        //   childAspectRatio: 3 / 4,
        //   crossAxisCount: 2,
        //   children:List.generate(cubit.plant.length, (index) => Column(
        //     children: [
        //       grid(cubit.productsData!.data![index].plant!.name!,
        //           cubit.productsData!.data![index].plant!.imageUrl!,
        //           cubit.productsData!.data![index].price!)
        //     ],
        //   ) )
        // ),
      ),
    );
  }
}

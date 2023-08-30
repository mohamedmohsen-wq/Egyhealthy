import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/hos_model/clinics_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/states.dart';
class HospitalStaff extends StatelessWidget {
  HospitalStaff({Key? key}) : super(key: key);
  var fixedHieght;
  var fixedWidth;
  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            body:


            SingleChildScrollView(
              child:

                Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: fixedHieght * 25 / fixedHieght,
                        right: fixedWidth * 10 / fixedWidth,
                        left: fixedWidth * 10 / fixedWidth),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: Text(
                                'Hospital Clinics ',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff255572)),
                              ),
                            ),
                            Text(""),
                          ],
                        ),


                        Container(
                          height: fixedHieght*600/fixedHieght,
                          child: ConditionalBuilder(
                              condition:
                              cubit.get(context).clinicsModel != null,
                              builder: (context) => InkWell(
                                onTap: () {},
                                child: Container(
                                  height: fixedHieght*777/fixedHieght,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        buildEmergencyCase(
                                            model: cubit.clinicsModel!.clincals![index],
                                            fixedHieght: fixedHieght, fixedWidth: fixedWidth),
                                    itemCount:cubit.clinicsModel!.clincals!.length ,
                                  ),
                                ),
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator())),
                        )

                      ],
                    ),
                  )
                ],
              ))



        );
      },
      listener: (context, state) {},
    );
  }
}
Widget buildEmergencyCase({
  required Clincals model,
  required double fixedHieght,
  required double fixedWidth,
}) {
  return Column(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: Color(0xff0277BD),
          width: double.infinity,
          height: fixedHieght * 80 / fixedHieght,
          child: Padding(
            padding: EdgeInsets.all(fixedHieght * 10 / fixedHieght),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(25),
                      child: Container(
                        child: Image.asset('assets/images/health-dent-logo-linear-style-icon_126523-338.jpg'),
                        color: Colors.white,
                        width: fixedWidth*46/fixedWidth,
                          height: fixedHieght * 48 / fixedHieght
                      ),
                    ),
                    SizedBox(width: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${model.name}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          '${model.doctor?.length}Doctors',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffB0B0B0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10,)

    ],
  );
}

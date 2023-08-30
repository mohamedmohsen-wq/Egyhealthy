import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/screens/Auth/userlogin/logIn/login.dart';
import 'package:egyhealthcare/screens/hospital/doctorsData/add_doctor.dart';
import 'package:egyhealthcare/screens/hospital/doctorsData/currentStaff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDatabase extends StatelessWidget {
  DoctorDatabase({Key? key}) : super(key: key);
  var fixedHieght;
  var fixedWidth;

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery
        .of(context)
        .size
        .height;
    fixedWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Hospital Staff",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          var cubit = AppCubit().get(context);

          return Padding(
            padding: EdgeInsets.all(fixedHieght * 15 / fixedHieght),
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 26,
                              color: Colors.grey.withOpacity(0),
                              width: 1,
                            ),
                            Expanded(
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeIndexMyOrderScreen(2);
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                          'Add Doctor',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: cubit.indexMyOrderScreen == 2
                                                ? cubit.colorText1
                                                : cubit.colorText2,
                                          ),
                                        )),
                                  ),
                                )),
                            Container(
                              height: 26,
                              color: Colors.grey.withOpacity(0),
                              width: 1,
                            ),
                            Expanded(
                                child: InkWell(
                                  onTap: () {
                                    cubit.changeIndexMyOrderScreen(1);
                                  },
                                  child: Container(
                                    width: 10,
                                    child: Center(
                                        child: Text(
                                          'Current Staff',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: cubit.indexMyOrderScreen == 1
                                                ? cubit.colorText1
                                                : cubit.colorText2,
                                          ),
                                        )),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          color: Color(0xffE2E2E2).withOpacity(0),
                          width: double.infinity,
                          height: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 2,
                                width: fixedWidth * 85 / fixedWidth,
                                color: cubit.indexMyOrderScreen == 2
                                    ? cubit.colorContainer1
                                    : cubit.colorContainer2,
                              ),
                              Container(
                                height: 2,
                                width: fixedWidth * 85 / fixedWidth,
                                color: cubit.indexMyOrderScreen == 1
                                    ? cubit.colorContainer1
                                    : cubit.colorContainer2,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    cubit.indexMyOrderScreen == 2
                        ? Container(
                        height: fixedHieght * 500 / fixedHieght,
                        child: AddDoctor())
                        : cubit.indexMyOrderScreen == 1 ?

                    CurrentStaff()


                        : Text("/cancle.png"),

                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}

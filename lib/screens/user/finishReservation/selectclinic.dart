import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/customButton.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../Widgets/componnents/componnents.dart';

class SelectClilinic extends StatelessWidget {
  SelectClilinic({Key? key, required this.hospitalsn}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  var fixedHieght;
  var fixedWidth;
  Hospitalsn hospitalsn;
  DateTime newDate = DateTime.now();
  var clinicController = TextEditingController();
  var dateController = TextEditingController();
  DateTime dateTime=DateTime(2023,7,12) ;
   DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String formated = formatter.format(newDate);

  @override
  Widget build(BuildContext context) {
    newDate != null ? formated=newDate.toString() : null;

    fixedHieght = MediaQuery
        .of(context)
        .size
        .height;
    fixedWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0277BD),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),


      backgroundColor: Color(0xff0277BD),
      body: BlocConsumer<AppCubit, AppStates>(

        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: fixedHieght * 140 / fixedHieght,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: fixedWidth * 164.77 / fixedWidth,
                              height: fixedHieght * 157.42 / fixedHieght,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/svgexport-6 (1).png')),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${hospitalsn.name}',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${hospitalsn.address}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    width: double.infinity,
                    height: fixedHieght * 617 / fixedHieght,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 7,
                          left: fixedWidth * 19 / fixedWidth,
                          right: fixedWidth * 19 / fixedWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: fixedHieght * 17 / fixedHieght,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Enter The Clinic',
                                style: TextStyle(color: Color(0xff255572)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: fixedHieght * 17 / fixedHieght,
                          ),
                          Container(
                            height: 70,
                            child: defaultFormField(
                                hintColor: Color(0xff707070),
                                hint: 'Ex. Dental',
                                controller: AppCubit()
                                    .get(context)
                                    .clinicController,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'clinc can not be Empty';
                                  }
                                },
                                type: TextInputType.name,
                                Bordercolor1: Colors.black,
                                Bordercolor2: Color(0xff0277BD),
                                textColor: Colors.black,
                                suffixColor: Color(0xff707070)),
                          ),
                          SizedBox(
                            height: fixedHieght * 17 / fixedHieght,
                          ),
                          InkWell(
                            onTap: () async {
                            newDate=  await showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2222)).then((value) => newDate=value!);
                            formated=formatter.format(newDate);
                            print("$formated");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Select The date',
                                  style: TextStyle(color: Color(0xff255572)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: fixedHieght * 17 / fixedHieght,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: fixedWidth * 12 / fixedWidth,
                                right: fixedWidth * 12 / fixedWidth),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                EmergencyDays(
                                    day: '${newDate.day}',
                                    width: fixedWidth * 68 / fixedWidth,
                                    hieght: fixedHieght * 68 / fixedHieght),
                                EmergencyDays(
                                    day: "${newDate.month}",
                                    width: fixedWidth * 68 / fixedWidth,
                                    hieght: fixedHieght * 68 / fixedHieght),
                                EmergencyDays(
                                    day: '${newDate.year}',
                                    width: fixedWidth * 68 / fixedWidth,
                                    hieght: fixedHieght * 68 / fixedHieght),
                                EmergencyDays(
                                    day: '1.Am',
                                    width: fixedWidth * 68 / fixedWidth,
                                    hieght: fixedHieght * 68 / fixedHieght)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: fixedHieght * 17 / fixedHieght,
                          ),
                          CustomButton(
                              Ontap: () {
                                if (formKey.currentState!.validate()) {
                                  AppCubit().get(context).PostReservationData(
                                      formated);
                                }
                                print("RESERVATION ID========${reservationId}");
                              },
                              color: Colors.blue,
                              ButtonName: "Complete Your Reservation ",
                              condition: state is! MakeReservationDataLoadingState),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is MakeReservationDataSuccessState) {
            if (state.makeReservationModel.status == true) {
              Fluttertoast.showToast(
                msg: state.makeReservationModel.msg.toString(),
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
              CacheHelper.setData(
                  key: 'id',
                  value: state.makeReservationModel.reservation!.id)
                  .then((value) {
                reservationId = state.makeReservationModel.reservation!.id;
                print("RESERVATION ID========${reservationId}");
              });
            } else {
              Fluttertoast.showToast(
                msg: state.makeReservationModel.msg.toString(),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            }
          } else if (state is MakeReservationDataErrorState) {
            Fluttertoast.showToast(
                msg: 'you have a reservation that is available ',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3);
          }
        },


      ),
    );
  }
}

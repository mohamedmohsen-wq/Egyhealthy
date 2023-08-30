import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/screens/hospital/home/hospitalHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egyhealthcare/hos_model/reservations_Model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReservationDetails extends StatelessWidget {
  ReservationDetails({Key? key, required this.reservations}) : super(key: key);
  Reservations reservations;
  var fixedHieght;
  var fixedWidth;
  List<Reservations>? hospitals;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;
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
          hospitals =
              AppCubit().get(context).hospitalReservationModel?.reservations;

          return SingleChildScrollView(
            child: reservations != null
                ? Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: fixedHieght * 195 / fixedHieght,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 88.0),
                                        child: Text(
                                          'Reservation\n   Details !',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: fixedHieght * 20 / fixedHieght,
                                ),
                                Text(
                                  'Patient Data',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: fixedHieght * 20 / fixedHieght,
                                ),
                                Container(
                                  height: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Patient Name:   ${reservations.user!.name}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: fixedHieght * 9 / fixedHieght,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Clinic:   ${reservations.clincal!.name}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: fixedHieght * 9 / fixedHieght,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date:   ${reservations.date}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: fixedHieght * 40 / fixedHieght,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConditionalBuilder(
                                      condition: State is !GetReservationRejectedLoadingState,
                                      builder: (BuildContext context) {
                                        return  InkWell(
                                          onTap: (){
                                            if(formKey.currentState!.validate()){
                                              AppCubit().get(context).getReservationRejected();
                                              AppCubit().get(context).getHospitalReservations();
                                              navigateTo(context, HospitalHome());

                                            }
                                          },
                                          child: Container(

                                            child: Center(
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(color: Colors.red),
                                              ),
                                            ),
                                            width: fixedWidth*200/fixedWidth,

                                            height: fixedHieght * 60 / fixedHieght,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                border: Border(
                                                    top:
                                                    BorderSide(color: Colors.red),
                                                    bottom:
                                                    BorderSide(color: Colors.red),
                                                    right:
                                                    BorderSide(color: Colors.red),
                                                    left: BorderSide(
                                                        color: Colors.red))),
                                          ),
                                        );
                                      },
                                      fallback: (BuildContext context) {
                                        return Container(

                                            height: fixedHieght * 60 / fixedHieght,
                                            width: fixedWidth*160/fixedWidth,
                                            child: Center(child: CircularProgressIndicator()));
                                      },

                                    ),
                                    ConditionalBuilder(
                                      condition: state is !GetReservationAcceptedLoadingState,
                                      builder: (BuildContext context) {
                                      return  InkWell(
                                        onTap: (){
                                          if(formKey.currentState!.validate()){
                                            AppCubit().get(context).getReservationAccepted();
                                            AppCubit().get(context).getHospitalReservations();
                                            navigateTo(context, HospitalHome());
                                          }
                                        },
                                        child: Container(

                                            child: Center(
                                              child: Text(
                                                "Accept ",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                            height: fixedHieght * 60 / fixedHieght,
                                            width: fixedWidth*200/fixedWidth,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                              BorderRadius.circular(15),

                                            ),
                                          ),
                                      );
                                      },
                                      fallback: (BuildContext context) {
                                        return Container(

                                            height: fixedHieght * 60 / fixedHieght,
                                            width: fixedWidth*160/fixedWidth,
                                            child: Center(child: CircularProgressIndicator()));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
        listener: (BuildContext context, Object? state) {
          if (state is GetReservationRejectedSuccessState) {
            if (state.rejectReservationModel.status == true) {
              Fluttertoast.showToast(
                msg: state.rejectReservationModel.toString(),
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            } else {
              Fluttertoast.showToast(
                msg: state.rejectReservationModel.toString(),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            }
          } else if (state is GetReservationRejectedErrorState) {
            Fluttertoast.showToast(
                msg: 'Rejected',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3);
          }
          if (state is GetReservationAcceptedSuccessState) {
            if (state.acceptReservationModel?.status == true) {
              Fluttertoast.showToast(
                msg: state.acceptReservationModel!.msg.toString(),
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            } else {
              Fluttertoast.showToast(
                msg: state.acceptReservationModel!.msg.toString(),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            }
          } else if (state is GetReservationAcceptedErrorState) {
            Fluttertoast.showToast(
                msg: 'Done SuccessFully',
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3);
          }
        },
      ),
    );
  }

  Column buildReservationDetails(Reservations model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Name:${model.user!.name}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
        SizedBox(
          height: fixedHieght * 9 / fixedHieght,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Clinic:${model.clincal!.name}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
        SizedBox(
          height: fixedHieght * 9 / fixedHieght,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date:${model.date}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ],
    );
  }
}

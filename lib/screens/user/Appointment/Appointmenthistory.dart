import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AppointmentHistory extends StatelessWidget {
  AppointmentHistory({Key? key}) : super(key: key);
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
            body: SingleChildScrollView(
          child: cubit.hospitalModel != null && cubit.reservationsModel != null
              ? SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: fixedHieght * 25 / fixedHieght,
                            right: fixedWidth * 10 / fixedWidth,
                            left: fixedWidth * 10 / fixedWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: fixedHieght * 10 / fixedHieght,
                            ),
                            Text(
                              'Upcoming Appointment',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff255572)),
                            ),
                            SizedBox(
                              height: fixedHieght * 15 / fixedHieght,
                            ),
                            cubit.reservationsModel!.reservations!.isNotEmpty &&
                                    cubit.reservationsModel!.reservations![cubit
                                                    .reservationsModel!
                                                    .reservations!
                                                    .length -
                                                1]
                                            .status ==
                                        'In progress'
                                ? ConditionalBuilder(
                                    condition: cubit.hospitalModel != null &&
                                        cubit.reservationsModel != null,
                                    builder: (context) => Container(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right:
                                                  fixedHieght * 5 / fixedHieght,
                                              left:
                                                  fixedHieght * 5 / fixedHieght),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${cubit.reservationsModel?.reservations![cubit.reservationsModel!.reservations!.length - 1].date!.substring(8, 10)}",
                                                      style: TextStyle(
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white),
                                                      maxLines: 3,
                                                    ),
                                                    Text(
                                                      '$reserMonth',
                                                      style: TextStyle(
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                                width:
                                                    fixedWidth * 64 / fixedWidth,
                                                height: fixedHieght *
                                                    63 /
                                                    fixedHieght,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffFFFFFF)
                                                        .withOpacity(.6),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                              SizedBox(
                                                width: fixedHieght *
                                                    10 /
                                                    fixedHieght,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].hospital!.name}',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          '${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].clincal?.name}',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          '',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          'No.${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].nORIH}',
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xff0277BD),
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        height: fixedHieght * 80 / fixedHieght),
                                    fallback: (context) => SizedBox())
                                : Container(
                                    height:fixedHieght* 80/fixedHieght,
                                    child: Center(
                                      child: Text('No Upcomming Reservation'),
                                    )),
                            SizedBox(
                              height: fixedHieght * 15 / fixedHieght,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Appointment History',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff255572)),
                                  ),
                                  SizedBox(
                                    height: fixedHieght * 15 / fixedHieght,
                                  ),
                                  Container(
                                          height: fixedHieght * 700 / fixedHieght,
                                          child: ConditionalBuilder(
                                              condition:
                                                  cubit.reservationsModel != null,
                                              builder: (context) => Container(
                                                height: fixedHieght *
                                                    700 /
                                                    fixedHieght,
                                                child: ListView.builder(
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '01') {
                                                        reserMonth='Jan';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '02') {
                                                        reserMonth='Feb';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '03') {
                                                        reserMonth='Mar';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '04') {
                                                        reserMonth='Apr';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '05') {
                                                        reserMonth='May';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '06') {
                                                        reserMonth='Jun';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '07') {reserMonth='Jul';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '08') {
                                                        reserMonth='Aug';
                                                      }else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '09') {
                                                        reserMonth='Sep';
                                                      }else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '10') {
                                                        reserMonth='Oct';
                                                      }
                                                      else if (cubit.reservationsModel!.reservations![index].date!.substring(5, 7) == '11') {
                                                        reserMonth='Nov';
                                                      }
                                                      else{reserMonth='Dec';

                                                      }

                                                      return AppointmentHistoryCard(
                                                          model: cubit
                                                                  .reservationsModel!
                                                                  .reservations![
                                                              index],
                                                          fixedHieght:
                                                              fixedHieght,
                                                          fixedWidth:
                                                              fixedWidth,
                                                          month: reserMonth);
                                                    },
                                                    itemCount: cubit
                                                        .reservationsModel!
                                                        .reservations!
                                                        .length),
                                              ),
                                              fallback: (context) => Center(
                                                  child: CircularProgressIndicator())),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              )
              : Center(child: CircularProgressIndicator()),
        ));
      },
      listener: (context, state) {},
    );
  }
}

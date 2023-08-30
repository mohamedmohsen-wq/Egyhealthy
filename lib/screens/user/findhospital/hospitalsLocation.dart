import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/screens/user/Appointment/bookappointment.dart';
import 'package:egyhealthcare/screens/user/search/filter_hospital_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/cubit.dart';
import '../../../Cubit/states.dart';
import '../../../Widgets/componnents/componnents.dart';
import '../../../hos_model/hospital_model.dart';

class HospitalsLocation extends StatelessWidget {
  HospitalsLocation({Key? key}) : super(key: key);
  var fixedHieght;
  var fixedWidth;
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;
    List<Hospitals> hospital = [];

    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var cubit = AppCubit().get(context);
        Hospitalsn hospitalsn;
        return Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                      BestMedical(fixedHieght: fixedHieght),
                      SizedBox(
                        height: fixedHieght * 10 / fixedHieght,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Find your desired \nhospital ',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff255572)),
                          ),
                          Text(""),
                        ],
                      ),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTo(context, FilterHospitals());
                              },

                              child: Text(
                                'Search for hospital or city',
                                style: TextStyle(
                                    color: Color(0xff707070), fontSize: 18),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  navigateTo(context, FilterHospitals());
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xff707070),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                      Text(
                        'Latest Search',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff255572)),
                      ),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                      ConditionalBuilder(
                          condition: cubit.get(context).hospitalModel != null,
                          builder: (context) => Container(
                                height: 200,
                                child: ListView.builder(
                                    itemBuilder: (context, index) =>
                                        buildSearchItem(
                                          cubit
                                              .hospitalModel!.hospitals![index],
                                          context,
                                        ),
                                    itemCount:
                                        cubit.hospitalModel!.hospitals!.length),
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator())),
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
                    cubit.reservationsModel!=null?ConditionalBuilder(
                        condition: cubit.hospitalModel != null &&
                            cubit.reservationsModel != null,
                        builder: (context) => cubit.reservationsModel!
                            .reservations!.isNotEmpty
                            ? Container(
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
                                          "${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].date!.substring(8, 10)}",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight:
                                              FontWeight.w700,
                                              color: Colors.white),
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
                                            Padding(
                                              padding: const EdgeInsets.only(right: 4.0),
                                              child: Text(
                                                'No. ${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].nORIH}',
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    color:
                                                    Colors.white),
                                              ),
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
                            height: fixedHieght * 80 / fixedHieght)
                            : Container(
                            height: 80,
                            child: Center(
                              child: Text('No Upcomming Reservation'),
                            )),
                        fallback: (context) => SizedBox()):
                      cubit.reservationsModel?.reservations![cubit.reservationsModel!.reservations!.length - 1].status == 'In progress'
                          ? ConditionalBuilder(
                              condition: cubit.hospitalModel != null &&
                                  cubit.reservationsModel != null,
                              builder: (context) => cubit.reservationsModel!
                                      .reservations!.isNotEmpty
                                  ? Container(
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
                                                    "${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].date!.substring(8, 10)}",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white),
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
                                                      Padding(
                                                        padding: const EdgeInsets.only(right: 4.0),
                                                        child: Text(
                                                          'No. ${cubit.reservationsModel!.reservations![cubit.reservationsModel!.reservations!.length - 1].nORIH}',
                                                          style: TextStyle(
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color:
                                                                  Colors.white),
                                                        ),
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
                                      height: fixedHieght * 80 / fixedHieght)
                                  : Container(
                                      height: 80,
                                      child: Center(
                                        child: Text('No Upcomming Reservation'),
                                      )),
                              fallback: (context) => SizedBox())
                          : Container(
                              height: 80,
                              child: Center(
                                child: Text('No Upcomming Reservation'),
                              )),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      },
      listener: (context, state) {},
    );
  }

  Widget buildSearchItem(
    Hospitals? hospitals,
    context,
  ) =>
      GestureDetector(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => BookLAstAppointment(
          //       hospitals: hospitals,
          //
          //     )));
        },
        child: Container(
          height: 80,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${hospitals!.name!.toUpperCase()}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0277BD),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xffB0B0B0),
                            size: 20,
                          ),
                          Text(
                            '${hospitals.city}',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xffB0B0B0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(""),
                ],
              ),
              Divider(
                color: Color(0xffCACACA),
              )
            ],
          ),
        ),
      );
}

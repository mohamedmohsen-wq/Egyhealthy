import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/customButton.dart';
import 'package:egyhealthcare/hos_model/hospital_model.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/screens/user/finishReservation/selectclinic.dart';
import 'package:egyhealthcare/screens/user/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Widgets/componnents/componnents.dart';

// ignore: must_be_immutable
class BookAppointment extends StatelessWidget {
  BookAppointment({Key? key, required this.hospitalsn, this.hospitals})
      : super(key: key);
  var fixedHieght;
  var fixedWidth;
  Hospitalsn hospitalsn;
  Hospitals? hospitals;
  int? index1;

  @override
  Widget build(BuildContext context) {
    index1 = hospitalsn.name == "hehia hospital" ? 0 : 1;
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0277BD),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
            navigateTo(context, Homepage());            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      backgroundColor: Color(0xff0277BD),
      body: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            child: hospitalsn != null
                ? Column(
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
                                      '${hospitalsn.city}',
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: fixedWidth * 182 / fixedWidth,
                                  height: fixedHieght * 45 / fixedHieght,
                                  child: CustomButton(
                                    Ontap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectClilinic(
                                                    hospitalsn: hospitalsn,
                                                  )));
                                    },
                                    ButtonName: 'Book Appointment',
                                    color: Color(0xff4CE3B2),
                                    condition: true,
                                  )),
                              SizedBox(
                                height: fixedHieght * 17 / fixedHieght,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Emergency Days',
                                    style: TextStyle(color: Color(0xff255572)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: fixedHieght * 17 / fixedHieght,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: fixedWidth * 12 / fixedWidth,
                                    right: fixedWidth * 12 / fixedWidth),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    EmergencyDays(
                                        day:
                                            '${hospitalsn.emergencyDays!.substring(0, 3)}',
                                        width: fixedWidth * 68 / fixedWidth,
                                        hieght: fixedHieght * 68 / fixedHieght),
                                    EmergencyDays(
                                        day:
                                            '${hospitalsn.emergencyDays!.substring(9, 12)}',
                                        width: fixedWidth * 68 / fixedWidth,
                                        hieght: fixedHieght * 68 / fixedHieght),
                                    EmergencyDays(
                                        day:
                                            '${hospitalsn.emergencyDays!.substring(18, 21)}',
                                        width: fixedWidth * 68 / fixedWidth,
                                        hieght: fixedHieght * 68 / fixedHieght),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: fixedHieght * 17 / fixedHieght,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Medical Staff',
                                    style: TextStyle(color: Color(0xff255572)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: fixedHieght * 17 / fixedHieght,
                              ),
                              index1 == 0
                                  ? Container(
                                      height: 300,
                                      child: hospitalsn != null
                                          ? GridView.builder(
                                              gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 200,
                                                      childAspectRatio: 3 / 2,
                                                      crossAxisSpacing: 20,
                                                      mainAxisSpacing: 20),
                                              itemBuilder:
                                                  (BuildContext context,
                                                      index) {
                                                var index1 = hospitalsn.name ==
                                                        "hehia hospital"
                                                    ? 0
                                                    : 1;
                                                return buildStaffItem(
                                                    AppCubit()
                                                        .get(context)
                                                        .hospitalModel
                                                        ?.hospitals![index1]
                                                        .doctor![index],
                                                    context);
                                              },
                                              itemCount: AppCubit()
                                                  .get(context)
                                                  .hospitalModel
                                                  ?.hospitals![
                                                      hospitalsn.name ==
                                                              "hehia hospital"
                                                          ? 0
                                                          : 1]
                                                  .doctor!
                                                  .length,
                                            )
                                          : Center(
                                              child: LinearProgressIndicator(
                                                color: Colors.blue,
                                              ),
                                            ),
                                    )
                                  : Container(
                                      height: 80,
                                      child: Center(
                                          child: Text("Staff is Empty Now")),
                                    )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }

  Container buildStaffItem(
    Doctor? model2,
    context,
  ) {
    return Container(
      width: fixedWidth * 146 / fixedWidth,
      height: fixedHieght * 134 / fixedHieght,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
                'assets/images/smiling-touching-arms-crossed-room-hospital.jpg'),
          ),
          Text(
            'Dr. ${model2?.name}',
            style: TextStyle(fontSize: 14, color: Color(0xff0277BD)),
          ),
          Text(
            '${model2?.specialty}',
            style: TextStyle(fontSize: 11, color: Color(0xffAEAEAE)),
          ),
          Text(
            '${model2?.presenceDays}',
            style: TextStyle(fontSize: 11, color: Color(0xffAEAEAE)),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Color(0xff0277BD)),
            left: BorderSide(color: Color(0xff0277BD)),
            right: BorderSide(color: Color(0xff0277BD)),
            bottom: BorderSide(color: Color(0xff0277BD))),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

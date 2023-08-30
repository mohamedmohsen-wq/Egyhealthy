import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/model/reservations_model.dart';
import 'package:flutter/material.dart';

Widget defaultFormField(
        {Widget? label,
        required String hint,
        var border = const OutlineInputBorder(),
        IconData? prefix,
        IconData? suffix,
        required TextEditingController controller,
        required var validate,
        required TextInputType type,
        var onSubmitted,
        var onIconPressed,
        required Color Bordercolor1,
        required Color Bordercolor2,
        required Color textColor,
        required Color hintColor,
        required Color suffixColor,
        bool obscuredText = false}) =>
    TextFormField(
      cursorColor: kSeconderycolor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: kPrimarycolor,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Bordercolor2),
            borderRadius: BorderRadius.circular(25)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Bordercolor2,
            ),
            borderRadius: BorderRadius.circular(25)),
        suffixIconColor: suffixColor,
        prefixIconColor: kSeconderycolor,
        iconColor: Colors.black,
        label: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            suffix,
          ),
          onPressed: onIconPressed,
        ),
      ),
      keyboardType: type,
      controller: controller,
      onFieldSubmitted: onSubmitted,
      obscureText: obscuredText,
      style: TextStyle(color: textColor),
      validator: validate,
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget HospitalCard({
  required String hospitalName,
  required String cityName,
  IconData? icon,
  Function? ontap,
}) =>
    GestureDetector(
      onTap: () {
        ontap;
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
                      hospitalName,
                      style: TextStyle(
                          fontSize: 13,
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
                          cityName,
                          style:
                              TextStyle(fontSize: 13, color: Color(0xffB0B0B0)),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  icon,
                  color: Color(0xff0277BD),
                )
              ],
            ),
            Divider(
              color: Color(0xffCACACA),
            )
          ],
        ),
      ),
    );

Widget DoctorsCard() => Card(
      elevation: 2,
      color: kSeconderycolor,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.person,
              fill: 1,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text('Dr: Ahmed ali '),
              SizedBox(
                height: 2,
              ),
              Text('Work time:  9 :6'),
              SizedBox(
                height: 2,
              ),
              Text(
                'vacations:  fri, sat',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );

Widget ReservationCard() => Card(
      elevation: 2,
      color: kSeconderycolor,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 60,
              child: Icon(
                Icons.person,
                fill: 1,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: Ahmed Khaled '),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'reservation day: Sunday',
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Reservation time: 11.00 am',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            weight: 100,
                          )),
                      Text(
                        "Add Med",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(onTap: () {}, child: Icon(Icons.info)),
                      Text(
                        "More Info",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

Widget EmergencyDays({
  context,
  required width,
  required hieght,
  required String day,
}) =>
    Container(
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: Color(0xff255572), fontSize: 22),
        ),
      ),
      color: Color(0xff4CE3B2).withOpacity(.3),
      width: width,
      height: hieght,
    );

Widget UpcomingAppointment(
        {required fixedHieght, required fixedWidth, required}) =>
    Container(
        child: Container(
          margin: EdgeInsets.only(
              right: fixedHieght * 5 / fixedHieght,
              left: fixedHieght * 5 / fixedHieght),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '27',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'Apr',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    )
                  ],
                ),
                width: fixedWidth * 64 / fixedWidth,
                height: fixedHieght * 63 / fixedHieght,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF).withOpacity(.6),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: fixedHieght * 10 / fixedHieght,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'El-Mabra Hospital',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          'Dental Clinic',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          'No. 15',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
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
        height: fixedHieght * 80 / fixedHieght);

Widget AppointmentHistoryCard({
  required Reservations? model,
  required fixedHieght,
  required fixedWidth,
  Color statusColor = Colors.black,
  Color statusCancledColor = Colors.red,
required String? month

}) =>
    Column(
      children: [
        Container(
height: fixedHieght*80/fixedHieght,
            child: Container(
              margin: EdgeInsets.only(
                  right: fixedHieght * 5 / fixedHieght,
                  left: fixedHieght * 5 / fixedHieght),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${model!.date!.substring(8,10)}',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          '$month',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )
                      ],
                    ),
                    width: fixedWidth * 64 / fixedWidth,
                    height: fixedHieght * 63 / fixedHieght,
                    decoration: BoxDecoration(
                        color: Color(0xff0277BD).withOpacity(.6),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    width: fixedHieght * 10 / fixedHieght,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${model.hospital?.name}",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue),
                            ),
                            Text(
                              '${model.clincal?.name}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                              Text(
                                '${model.status}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: statusColor),
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
              color: Color(0xff4CE3B2).withOpacity(.3),
              borderRadius: BorderRadius.circular(25),
            ),

),

 SizedBox(height: 10,)
      ],
    );
Widget BestMedical({required fixedHieght, required}) => Container(
      child: Padding(
        padding: EdgeInsets.only(
            right: fixedHieght * 9 / fixedHieght,
            left: fixedHieght * 9 / fixedHieght,
            top: fixedHieght * 9 / fixedHieght),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get The Best \nMedical Service',
                  style: TextStyle(fontSize: 21, color: Color(0xff255572)),
                ),
                SizedBox(
                  height: fixedHieght * 2 / fixedHieght,
                ),
                Text(
                  'Find nearby hospitals, and\nbook and appointments',
                  style: TextStyle(fontSize: 11, color: Color(0xff255572)),
                ),
              ],
            )
          ],
        ),
      ),
      width: double.infinity,
      height: fixedHieght * 143 / fixedHieght,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Group 2094.png'),
              fit: BoxFit.fill)),
    );

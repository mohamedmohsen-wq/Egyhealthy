import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:egyhealthcare/hos_model/reservations_Model.dart';
import 'package:egyhealthcare/screens/hospital/reservationDetails/reservationDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalAppointHistory extends StatelessWidget {
  HospitalAppointHistory({Key? key,}) : super(key: key);
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
        body: BlocConsumer<AppCubit, AppStates>(
          builder: (BuildContext context, state) {
            var cubit = AppCubit().get(context);
            return SingleChildScrollView(
              child: Column(
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
                                'Appointment History  ',
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
                              cubit
                                  .get(context)
                                  .hospitalReservationModel != null,
                              builder: (context) =>
                                  Container(
                                    height: fixedHieght*600/fixedHieght,

                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          InkWell(
                                            child: buildEmergencyCase(
                                                cubit
                                                    .hospitalReservationModel!
                                                    .reservations![index],
                                                fixedHieght,
                                                context

                                            ),
                                          ),
                                      itemCount: cubit
                                          .hospitalReservationModel!
                                          .reservations!.length-1 ,


                                    ),
                                  ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator())),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          listener: (BuildContext context, Object? state) {},
        ));
  }
}

Widget buildEmergencyCase(Reservations model,
    double fixedHieght,
    context,) {
  return InkWell(

    onTap: (){
      AppCubit().getHospitalReservations();
     initialId="${model.id.toString()})";
      print('${initialId}');
      model.status=='In progress'?

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ReservationDetails(reservations: model


              ))):
      Text('Can not')
      ;

    },
    child: Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: fixedHieght * 80 / fixedHieght,
          child: Padding(
            padding: EdgeInsets.all(fixedHieght * 10 / fixedHieght),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${model.user?.name}',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff0277BD)),
                        ),
                        Text(
                          '${model.clincal?.name}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffB0B0B0)),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${model.status}'),
                        Text('${model.createdAt?.substring(10, 16)}Am',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffB0B0B0))),
                      ],
                    )
                  ],
                ),
                Divider(color: Colors.grey,),
              ],
            ),
          ),
        ),
        SizedBox(height: fixedHieght * 7 / fixedHieght,)
      ],
    ),
  );
}

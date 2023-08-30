import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/hos_model/doctor_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentStaff extends StatelessWidget {
  CurrentStaff({super.key});

  var fixedHieght;
  var fixedWidth;

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return  BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: fixedHieght * 25 / fixedHieght,
              ),
              AppCubit().getDoctorModel==null?
              ConditionalBuilder(
                  condition:state is !GetDoctorLoadingState,
                  builder: (context) => Container(
                    height: fixedHieght*400/fixedHieght,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return buildDoctorStaffCard(context: context,model: AppCubit().get(context).getDoctorModel!.doctors![index]);
                      },

                      itemCount:AppCubit().get(context).getDoctorModel!.doctors!.length,
                    ),
                  ),
                  fallback: (contex) => CircularProgressIndicator()):
                  Container(
                    height: 82,
                    child: Center(child: Text('There is no doctors now'),),
                  )
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }

  Column buildDoctorStaffCard( {Doctors? model,
  context
  }) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model!.name}',
                    style: TextStyle(
                        color: Color(0xff0277BD),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  Text(
                    '${model.clincal!.name}',
                    style: TextStyle(
                        color: Color(0xffB0B0B0),
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  )
                ],
              ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Text(''),
                    Row(
                      children: [
                        Text(
                          'Days: ',
                          style: TextStyle(
                              color: Color(0xff0277BD),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                        Text(
                          '${model.presenceDays}',
                          style: TextStyle(
                              color:Color(0xffB0B0B0),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),

                      ],
                    ),

                  ],
                )
            ],
          ),
        ),
        Divider(
          color: Color(0xffCACACA),
        )
      ],
    );
  }
}

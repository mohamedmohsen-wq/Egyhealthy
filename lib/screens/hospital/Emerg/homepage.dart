import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/hos_model/emergencycases_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalHomePage extends StatelessWidget {
  HospitalHomePage({Key? key}) : super(key: key);
  var fixedHieght;
  var fixedWidth;
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        var cubit = AppCubit().get(context);
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
                        height: fixedHieght * 20 / fixedHieght,
                      ),
                      Text(" Emergency",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:  Color(0xff0277BD)),),
                      SizedBox(
                        height: fixedHieght * 5 / fixedHieght,
                      ),
                      ConditionalBuilder(
                          condition:
                              cubit.get(context).emergencyCasesModel != null,
                          builder: (context) => Container(
                                height: 200,
                                child: InkWell(
                                  onTap: () {},
                                  child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          buildEmergencyCase(
                                              model: cubit.emergencyCasesModel!
                                                  .emergencyCases![index]),
                                      itemCount: cubit.emergencyCasesModel!
                                          .emergencyCases!.length),
                                ),
                              ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator())),
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

  Widget buildEmergencyCase({required EmergencyCases model}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Color(0xff0277BD),
            width: double.infinity,
            height: fixedHieght * 80 / fixedHieght,
            child: Padding(
              padding: EdgeInsets.all(fixedHieght * 15 / fixedHieght),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${model.user!.name}',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        '${model.userInfo!.phone}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffD4D4D4)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(''),
                      Text('${model.createdAt!.substring(10,16)}Am',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: fixedHieght * 10 / fixedHieght,)
      ],
    );
  }
}

import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/Widgets/componnents/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDoctor extends StatelessWidget {
  AddDoctor({Key? key}) : super(key: key);
  var doctorNameController = TextEditingController();
  var doctorDOFController = TextEditingController();
  var doctorSpecialController = TextEditingController();
  var fixedHieght;
  var fixedWidth;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 173,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Asset 1@4x.png',
                        height: fixedHieght * 108 / fixedHieght,
                        width: fixedHieght * 108 / fixedHieght,
                      ),
                    ),
                  ),
                  Container(
                    height: fixedHieght * 80 / fixedHieght,
                    child: defaultFormField(
                        hintColor: Color(0xff707070),
                        hint: 'Enter doctor name',
                        controller: doctorNameController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Enter doctor name';
                          }
                        },
                        type: TextInputType.name,
                        Bordercolor1: Colors.black,
                        Bordercolor2: Color(0xff707070).withOpacity(0.5),
                        textColor: Colors.black,
                        suffixColor: Color(0xff707070)),
                  ),
                  Container(
                    height: fixedHieght * 80 / fixedHieght,
                    child: defaultFormField(
                        hintColor: Color(0xff707070),
                        hint: 'Enter Specialization',
                        controller: doctorSpecialController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Enter Specialization';
                          }
                        },
                        type: TextInputType.name,
                        Bordercolor1: Colors.black,
                        Bordercolor2: Color(0xff707070).withOpacity(0.5),
                        textColor: Colors.black,
                        suffixColor: Color(0xff707070)),
                  ),
                  Container(
                    height: fixedHieght * 80 / fixedHieght,
                    child: defaultFormField(
                        hintColor: Color(0xff707070),
                        hint: 'Enter Presence Days',
                        controller: doctorDOFController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Enter Presence Days';
                          }
                        },
                        type: TextInputType.name,
                        Bordercolor1: Colors.black,
                        Bordercolor2: Color(0xff707070).withOpacity(0.5),
                        textColor: Colors.black,
                        suffixColor: Color(0xff707070)),
                  ),
                  CustomButton(
                      Ontap: () {
                        if (formKey.currentState!.validate()) {
                          AppCubit().get(context).PostNewDoctorData(
                              name: doctorNameController.text,
                              specialty: doctorSpecialController.text,
                              presence_days: doctorDOFController.text);
                        }
                      },
                      color: Color(0xff0277BD),
                      ButtonName: "Add Doctor",
                      condition: state is! AddDoctorLoadingState)
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is AddDoctorSuccessState) {
          if (state.addDoctorModel.status == true) {
            Fluttertoast.showToast(
              msg: state.addDoctorModel.msg!,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
            );
          } else if (state.addDoctorModel.status == false) {
            Fluttertoast.showToast(
              msg: state.addDoctorModel.msg!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
            );
          }
        } else if (state is AddDoctorErrorState) {
          Fluttertoast.showToast(
              msg: 'Auth failed ,something error with email or password. ',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3);
        }
      },
    );
  }
}

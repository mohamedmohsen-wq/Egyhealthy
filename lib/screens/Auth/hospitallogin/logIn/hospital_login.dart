import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/network/local/cache_helper.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalcubit.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalstates.dart';
import 'package:egyhealthcare/screens/hospital/home/hospitalHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../Widgets/componnents/customButton.dart';
import '../../../../Widgets/customTextfield.dart';
import '../../../../Widgets/componnents/constants.dart';

class HospitalLogInPage extends StatelessWidget {
  HospitalLogInPage({Key? key}) : super(key: key);
  var hospitalFormKey = GlobalKey<FormState>();
  var hospitalNameController = TextEditingController();
  var hospitalPasswordController = TextEditingController();
  var fixedHieght;
  var fixedWidth;

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => HospitalLoginCubit(),
      child: BlocConsumer<HospitalLoginCubit, HospitalLoginStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: kSeconderycolor,
            body: Form(
              key: hospitalFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: fixedWidth * 30 / fixedWidth),
                      child: Container(
                        height: fixedHieght * 330 / fixedHieght,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Icon(

                                            Icons.person,
                                            color: Colors.blueGrey,
                                          ),
                                      Text("User Login",style: TextStyle(fontSize: 10,color: Colors.grey),)
                                    ],
                                  )
                                ],
                              ),
                              Image.asset(
                                'assets/images/undraw_medicine_b1ol (1).png',
                                height: fixedHieght * (170 / fixedHieght),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.bottomCenter,
                      height: fixedHieght * 470 / fixedHieght,
                      width: double.infinity,
                      color: Color(0xff0277BD),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: fixedHieght * 30 / fixedHieght),
                        child: Column(
                          children: [
                            SizedBox(
                              height: fixedHieght * (30 / fixedHieght),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome Back 👋",
                                  style: TextStyle(
                                      color: kSeconderycolor, fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: fixedHieght * (20 / fixedHieght),
                            ),
                            defaultFormField(
                                prefix: Icons.local_hospital,
                                controller: hospitalNameController,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Hospital Name can not be empty';
                                  }
                                  return null;
                                },
                                type: TextInputType.emailAddress,
                                hint: 'Enter your username',
                                Bordercolor1: Colors.white,
                                Bordercolor2: Colors.white,
                                textColor: Colors.white,
                                hintColor: kSeconderycolor,
                                suffixColor: kSeconderycolor),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormField(
                              suffix: HospitalLoginCubit()
                                  .get(context)
                                  .hospitalSuffixIcon,
                              obscuredText: HospitalLoginCubit()
                                  .get(context)
                                  .hospitalIsObscure,
                              onIconPressed: () {
                                HospitalLoginCubit()
                                    .get(context)
                                    .changeHospitalSuffixVisibility();
                              },
                              prefix: Icons.lock_open_outlined,
                              controller: hospitalPasswordController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'password can not be empty';
                                }
                                return null;
                              },
                              type: TextInputType.visiblePassword,
                              hint: 'Enter your password',
                              Bordercolor1: Colors.white,
                              Bordercolor2: Colors.white,
                              textColor: Colors.white,
                              hintColor: kSeconderycolor,
                              suffixColor: kSeconderycolor,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                if (hospitalFormKey.currentState!
                                    .validate()) {
                                  HospitalLoginCubit()
                                      .get(context)
                                      .postHospitalLoginData(
                                      name: hospitalNameController.text,
                                      password:
                                      hospitalPasswordController
                                          .text);
                                }
                              },
                              child: CustomButton(
                                ButtonName: 'LogIn',
                                color: Color(0xff0089DB),
                                condition:
                                state is! HospitalLoginDataLoadingState,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    /*  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("don't have an account ?"),
                        SizedBox(
                          width: 10,
                        ),
                        TextButton(onPressed: () {
                          navigateTo(context, RegisterPage());
                        }, child: Text('REGISTER ')
                        )
                      ],
                    ),*/ //register doctor
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is HospitalLoginDataSuccessState) {
            if (state.hosLoginModel.original?.status == true) {
              Fluttertoast.showToast(
                msg: state.hosLoginModel.original!.msg!,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
              CacheHelper.setData2(
                  key: 'api_token',
                  value:
                  state.hosLoginModel.original!.hospital!.apiToken)
                  .then((value) {
                hospitalToken =
                    state.hosLoginModel.original!.hospital!.apiToken;
                print('Your Token================================$hospitalToken ==================================');
                navigateAndFinish(context, HospitalHome());
              });
            } else if(state.hosLoginModel.original!.status == false) {
              Fluttertoast.showToast(
                msg: state.hosLoginModel.original!.msg!,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            }
          } else if (state is HospitalLoginDataErrorState) {
            Fluttertoast.showToast(
                msg: 'Auth failed ,something error with name or password ',
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

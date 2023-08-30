import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/screens/Auth/userlogin/logIn/login.dart';
import 'package:egyhealthcare/screens/user/walkthrow/walkThrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Widgets/componnents/customButton.dart';
import '../../../Widgets/customTextfield.dart';
import '../../../Widgets/componnents/constants.dart';
import '../../../network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterPage extends StatelessWidget {
  var fixedHieght;
  var fixedWidth;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmController = TextEditingController();

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

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterDataSuccessState) {
            if (state.registerModel.status == true&&state.registerModel.errNum=="200") {
              Fluttertoast.showToast(
                msg: state.registerModel.msg!,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,

              );
              CacheHelper.setData(
                  key: 'api_token', value: state.registerModel.user!.apiToken)
                  .then((value) {
                userToken = state.registerModel.user!.apiToken;
                navigateAndFinish(context, WalkThrow());
              });
            }
            else  if (state.registerModel.status == false &&state.registerModel.errNum=="400"){
              Fluttertoast.showToast(
                msg: state.registerModel.msg.toString(),
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
              );
            }
          }
          else if (state is RegisterDataErrorState) {
            String msg;
            passwordController.text==confirmController.text?
                msg='The email has already been taken':
                msg='The password confirmation does not match ';
            Fluttertoast.showToast(
                msg:msg ,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3);
          }
        },
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Container(
                color: Color(0xff0277BD),
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: fixedHieght * 150 / fixedHieght,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(
                      horizontal: fixedWidth * 30 / fixedWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                          },
                          child: Text('You have account !',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20))),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        ButtonName: 'Log In',
                        Ontap: () {
                          navigateTo(context, LogInPage());
                        },
                        color: Color(0xff0089DB),
                        condition: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: kSeconderycolor,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: fixedWidth * 10 / fixedWidth),
                      child: Container(
                        height: fixedHieght * 455 / fixedHieght,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: fixedHieght * (45 / fixedHieght),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Create an account",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: fixedHieght * (7 / fixedHieght),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        children: [
                                          Text(
                                            "Fill the following information",
                                            style: TextStyle(
                                              color: Color(0xffB1B1B1),
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: fixedHieght * (25 / fixedHieght),
                              ),
                              defaultFormField(
                                  hintColor: Colors.black,

                                  hint: 'Enter Your Name',
                                  controller: nameController,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'This field can not be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.name,
                                  Bordercolor1: Colors.black,
                                  Bordercolor2: Colors.black,
                                  textColor: Colors.black, suffixColor: Color(0xff707070)),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  hintColor: Color(0xff707070),

                                  hint: 'Enter your email',
                                  controller: emailController,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'This field can not be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.emailAddress,
                                  Bordercolor1: Colors.black,
                                  Bordercolor2: Colors.black,
                                  textColor: Colors.black, suffixColor: Color(0xff707070)),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                onIconPressed: (){
                                  RegisterCubit().get(context).changeSuffixVisibility();
                                },
                                  hintColor: Color(0xff707070),
                                  suffix: RegisterCubit()
                                      .get(context)
                                      .suffixIcon,
                                  obscuredText: RegisterCubit()
                                      .get(context)
                                      .isObscure,

                                  hint: 'Enter your password',
                                  controller: passwordController,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'This field can not be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.visiblePassword,
                                  Bordercolor1: Colors.black,
                                  Bordercolor2: Colors.black,
                                  textColor: Colors.black, suffixColor: Color(0xff707070)),
                              SizedBox(
                                height: 10,
                              ),
                              defaultFormField(
                                  suffix: RegisterCubit()
                                      .get(context)
                                      .suffixIcon,
                                  obscuredText: RegisterCubit()
                                      .get(context)
                                      .isObscure,

                                  hintColor: Color(0xff707070),
                                  hint: 'Confirm your password',
                                  controller: confirmController,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return 'This field can not be empty';
                                    }
                                    return null;
                                  },
                                  type: TextInputType.visiblePassword,
                                  Bordercolor1: Colors.black,
                                  Bordercolor2: Colors.black,
                                  textColor: Colors.black, suffixColor: Color(0xff707070)),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  if(formKey.currentState!.validate()){
                                    RegisterCubit().get(context).postRegisterData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      confirmPassword: confirmController.text,
                                      name: nameController.text,
                                    );
                                  }

                                },
                                child: CustomButton(
                                  ButtonName: 'Sign Up',
                                  color: Color(0xff0089DB),
                                  condition: state is! RegisterDataLoadingState,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

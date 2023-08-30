import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalcubit.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/cubit/hospitalstates.dart';
import 'package:egyhealthcare/screens/Auth/hospitallogin/logIn/hospital_login.dart';
import 'package:egyhealthcare/screens/Auth/register/Register.dart';
import 'package:egyhealthcare/screens/Auth/userlogin/logIn/cubit/Userstates.dart';
import 'package:egyhealthcare/screens/user/walkthrow/walkThrow.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../Widgets/componnents/customButton.dart';
import '../../../../Widgets/componnents/constants.dart';
import '../../../../network/local/cache_helper.dart';
import '../../../hospital/home/hospitalHome.dart';

import 'cubit/UserCubit.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var hospitalFormKey = GlobalKey<FormState>();
  var hospitalNameController = TextEditingController();
  var hospitalPasswordController = TextEditingController();
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();
  var fixedHieght;
  var fixedWidth;

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kSeconderycolor,
      body: FlipCard(
        front: BlocProvider(
          create: (context) => UserLoginCubit(),
          child: BlocConsumer<UserLoginCubit, UserLoginStates>(
            builder: (BuildContext context, state) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(

                                      Icons.local_hospital_outlined,
                                      color: Colors.blueGrey,
                                    ),
                                    SizedBox(width: fixedWidth*5/fixedWidth,),
                                    Text("Login As Hospital",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.grey),),

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
                      SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: fixedHieght * 470 / fixedHieght,
                          width: double.infinity,
                          color: Color(0xff0277BD),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: fixedWidth * 30 / fixedWidth),
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
                                    prefix: Icons.email,
                                    controller: userEmailController,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'Email can not be empty';
                                      }
                                      return null;
                                    },
                                    type: TextInputType.emailAddress,
                                    hint: 'Enter your email',
                                    Bordercolor1: Colors.white,
                                    Bordercolor2: Colors.white,
                                    textColor: Colors.white,
                                    hintColor: kSeconderycolor,
                                    suffixColor: kSeconderycolor),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultFormField(
                                  suffix: UserLoginCubit()
                                      .get(context)
                                      .userSuffixIcon,
                                  obscuredText: UserLoginCubit()
                                      .get(context)
                                      .userIsObscure,
                                  onIconPressed: () {
                                    UserLoginCubit()
                                        .get(context)
                                        .changeUserSuffixVisibility();
                                  },
                                  prefix: Icons.lock_open_outlined,
                                  controller: userPasswordController,
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
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      UserLoginCubit()
                                          .get(context)
                                          .postLoginData(
                                              email: userEmailController.text,
                                              password:
                                                  userPasswordController.text);

                                      }

                                  },
                                  child: CustomButton(
                                    ButtonName: 'LogIn',
                                    color: Color(0xff0089DB),
                                    condition:
                                        state is! UserLoginDataLoadingState,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, 'RegisterPage');
                                        },
                                        child: Text('Forget Password ?!',
                                            style: TextStyle(
                                                color: kSeconderycolor))),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      navigateTo(context, RegisterPage());
                                    },
                                    child: Text(
                                        'Don`t have an account ? \t Register',
                                        style:
                                            TextStyle(color: kSeconderycolor))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state is UserLoginDataSuccessState) {
                if (state.loginModel.original!.status == true) {
                  Fluttertoast.showToast(
                    msg: state.loginModel.original!.msg!,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                  );
                  CacheHelper.setData(
                          key: 'api_token',
                          value: state.loginModel.original!.user!.apiToken)
                      .then((value) {
                    userToken = state.loginModel.original!.user!.apiToken;
                    navigateAndFinish(context, WalkThrow());
                    print("userToken========${userToken}");
                  });
                  CacheHelper.setData(
                          key: 'api_token',
                          value: state.loginModel.original!.user!.name)
                      .then((value) {
                    username = state.loginModel.original!.user!.name;
                    print("userToken========${username}");
                  });
                  CacheHelper.setData(
                          key: 'api_token',
                          value: state.loginModel.original!.user!.email)
                      .then((value) {
                    useremail = state.loginModel.original!.user!.email;
                    navigateAndFinish(context, WalkThrow());
                    print("userToken========${userToken}");
                  });
                }

                else if(state.loginModel.original!.status == false) {
                  Fluttertoast.showToast(
                    msg: state.loginModel.original!.msg!,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3,
                  );
                }
              }





              else if (state is UserLoginDataErrorState) {
                Fluttertoast.showToast(
                    msg: 'Auth failed ,something error with email or password. ',
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 3);
              }
            },
          ),
        ),
        back: HospitalLogInPage(),
      ),
    );
  }
}

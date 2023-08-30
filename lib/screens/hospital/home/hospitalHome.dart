import 'package:egyhealthcare/Widgets/componnents/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/cubit.dart';
import '../../../Cubit/states.dart';

class HospitalHome extends StatelessWidget {
  var fixedHieght;
  var fixedWidth;


  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocProvider(create: (context) =>AppCubit()..getEmergency(),

      child: BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context, state){
        var cubit =AppCubit().get(context);
        return Scaffold(
            bottomNavigationBar: Container(

              height: fixedHieght*100/fixedHieght,
              child: Container(

                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(fixedWidth*21/fixedWidth),

                  height: fixedHieght*53/fixedHieght,
                  width:fixedWidth*230/fixedWidth,
                  child: Center(
                    child: BottomNavigationBar(
                      selectedItemColor: Color(0xff0277BD),
                      unselectedItemColor: Color(0xffBDBDBD),
                      items:cubit.hospitalBottomItems,currentIndex: cubit.hospitalCurrent,
                      onTap: (i){
                        cubit.ChangeHospitalBottomNavBar(i);
                      },

                    ),
                  ),
                ),
              ),
            ),
            body:cubit.hospitalScreens[cubit.hospitalCurrent]);

      }, listener:(BuildContext context, state){}),
    );

  }
}

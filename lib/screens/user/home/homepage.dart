import 'package:egyhealthcare/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/cubit.dart';

class Homepage extends StatelessWidget {
  var fixedHieght;
  var fixedWidth;


  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return BlocProvider(create: (context) =>AppCubit()..getLastHospitals()..getReservations(),

    child: BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context, state){
      var cubit =AppCubit().get(context);
      return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
            height: 100,
            child: Container(
              
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                margin: EdgeInsets.all(fixedWidth*21/fixedWidth),

                height: fixedHieght*53/fixedHieght,
                width:fixedWidth*230/fixedWidth,
                child: BottomNavigationBar(items:cubit.bottomItems,currentIndex: cubit.current,
                  onTap: (index){
                  cubit.ChangeBottomNavBar(index);
},

                ),
              ),
            ),
          ),
          body:cubit.screens[cubit.current]);

    },
        listener:(BuildContext context, state){}),
    );
    
  }
}

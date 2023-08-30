import 'package:egyhealthcare/Cubit/cubit.dart';
import 'package:egyhealthcare/Cubit/states.dart';
import 'package:egyhealthcare/Widgets/componnents/search_widget.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/screens/user/Appointment/bookappointment.dart';
import 'package:egyhealthcare/screens/user/search/data/book_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterHospitals extends StatefulWidget {
  @override
  FilterHospitalsState createState() => FilterHospitalsState();
}

class FilterHospitalsState extends State<FilterHospitals> {
  List<Hospitalsn>? hospitals;
  String query = '';

  @override
  void initState() {
    super.initState();

    hospitals = allHospitals;
  }

  @override
  Widget build(BuildContext context) {
    var fixedHieght = MediaQuery.of(context).size.height;
    var fixedWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppStates>(
      listener:(BuildContext context, state){} ,
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.only( top: fixedHieght * 25 / fixedHieght,
                right: fixedWidth * 10 / fixedWidth,
                left: fixedWidth * 10 / fixedWidth),
            child: Column(
              children: <Widget>[
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                    itemCount: hospitals!.length,
                    itemBuilder: (context, index) {
                      final book = hospitals![index];

                      return buildHospital(book);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Hospital or City Name',
        onChanged: searchHospital,
      );

  Widget buildHospital(Hospitalsn hospital)
  => GestureDetector(
    onTap: () {
      AppCubit().get(context).getHospitalReservations();
      AppCubit().get(context).getLastHospitals();
      AppCubit().get(context).getClinics();
      AppCubit().get(context).getReservations();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BookAppointment(
            hospitalsn: hospital,
          )));

    },
    child: Container(
      height: 80,
      width: double.infinity,
      child:
      Column(
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
                    '${hospital.name!.toUpperCase()}',
                    style: TextStyle(
                        fontSize: 16,
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
                        '${hospital.city}',
                        style: TextStyle(
                            fontSize: 13, color: Color(0xffB0B0B0)),
                      ),
                    ],
                  ),
                ],
              ),
         IconButton( icon: Icon(Icons.add_call,color: Colors.blue), onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookAppointment(

                                hospitalsn: hospital,
                              )));
                    },),
            ],
          ),
          Divider(
            color: Color(0xffCACACA),
          )
        ],
      ),
    ),
  );

  void searchHospital(String query) {
    final hospitals = allHospitals.where((book) {
      final titleLower = book.name!.toLowerCase();
      final authorLower = book.city!.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.hospitals = hospitals;
    });
  }
}

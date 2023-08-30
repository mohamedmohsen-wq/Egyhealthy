import 'package:egyhealthcare/Widgets/componnents/componnents.dart';
import 'package:egyhealthcare/model/search_n.dart';
import 'package:egyhealthcare/screens/user/search/cubit/searchcubit.dart';
import 'package:egyhealthcare/screens/user/search/cubit/searchstates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class DesiredHospital extends StatelessWidget {
  DesiredHospital({Key? key}) : super(key: key);
  var fixedHieght;
  var fixedWidth;
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    fixedHieght = MediaQuery.of(context).size.height;
    fixedWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (BuildContext context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchStates>(
          builder: (BuildContext context, state) {
            var cubit = SearchCubit().get(context);
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: fixedHieght * 25 / fixedHieght,
                    right: fixedWidth * 10 / fixedWidth,
                    left: fixedWidth * 10 / fixedWidth),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Text(
                              'Find your desired \nhospital ',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff255572)),
                            ),
                          ),
                          Text(""),
                        ],
                      ),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                            color: Color(0xffF3F3F3).withOpacity(.9),
                            width: double.infinity,
                            child: defaultFormField(
                                suffix: Icons.search,
                                controller: searchController,
                                onIconPressed: (){
                                  if(formKey.currentState!.validate()){
                                    cubit.getSearch(text: searchController.toString());

                                  }
                                },

                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'search can not be empty';
                                  }
                                  return null;
                                },
                                type: TextInputType.text,
                                onSubmitted: (text) {
                                  if (formKey.currentState!.validate())
                                    SearchCubit()
                                        .get(context)
                                        .getSearch(text: searchController.text);
                                },
                                hint: 'Zaga |',
                                Bordercolor1: Color(0xff8D8D8D),
                                Bordercolor2: Color(0xff8D8D8D),
                                textColor: Color(0xff8D8D8D),
                                hintColor: Color(0xff8D8D8D),
                                suffixColor: Color(0xff8D8D8D))),
                      ),
                      SizedBox(
                        height: fixedHieght * 15 / fixedHieght,
                      ),
                      if (state is GetSearchLoadingState)
                        LinearProgressIndicator(),
                      if (state is GetSearchSuccessState)
                        Container(
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) => buildSearchItem(
                              model: SearchCubit()
                                  .get(context)
                                  .searchModel!
                                  .hospitalsn![index],
                            ),
                            itemCount: SearchCubit()
                                .get(context)
                                .searchModel!
                                .hospitalsn!
                                .length,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  Widget buildSearchItem({
    required Hospitalsn model,
    context,
  }) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 80,
          width: double.infinity,
          child: Column(
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
                        '${model.name!.toUpperCase()}',
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
                            '${model.city}',
                            style: TextStyle(
                                fontSize: 13, color: Color(0xffB0B0B0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(""),
                ],
              ),
              Divider(
                color: Color(0xffCACACA),
              )
            ],
          ),
        ),
      );
}

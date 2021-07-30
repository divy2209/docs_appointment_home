import 'package:docs_appointment_home/doctor_model.dart';
import 'package:docs_appointment_home/doctor_service.dart';
import 'package:docs_appointment_home/services/doctor_api_manager.dart';
import 'package:docs_appointment_home/services/doctor_api_model.dart';
import 'package:docs_appointment_home/services/home/category_list.dart';
import 'package:docs_appointment_home/services/utility.dart';
import 'package:docs_appointment_home/widgets/category_card.dart';
import 'package:docs_appointment_home/widgets/doctor_card.dart';
import 'package:docs_appointment_home/widgets/search_box.dart';
import 'package:docs_appointment_home/widgets/search_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<DoctorApiModel> _doctorApiModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _doctorApiModel = DoctorApiManager().getDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Palette.primaryBackground,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))
                ),
                padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi Siam.', style: TextStyle(fontSize: 20),),
                    SizedBox(height: 15,),
                    Text('How Do You Feel', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text('Today', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchField(),
                        SearchButton()
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Categories:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                        Text('See All', style: TextStyle(color: Palette.primaryGreen, fontWeight: FontWeight.w900, fontSize: 15),)
                      ],
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              Container(
                height: 170,
                padding: EdgeInsets.only(left: 23),
                color: Palette.primaryBackground,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return CategoryCard(image: CategoryList.images[index], text: CategoryList.names[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
                color: Palette.primaryBackground,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nearest Specialist:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                    Text('See All', style: TextStyle(color: Palette.primaryGreen, fontWeight: FontWeight.w900, fontSize: 15),)
                  ],
                ),
              ),
              Container(
                //height: 332,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 27),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  color: Palette.primaryBackground
                ),
                child: FutureBuilder<DoctorApiModel>(
                  future: _doctorApiModel,
                  builder: (context, doc) {
                    if(doc.hasData) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(height: 1, color: Colors.transparent,);
                                },
                                itemBuilder: (context, index) {
                                  final snap = doc.data!.data[index];
                                  return DoctorCard(doc: snap);
                                },
                              ),
                            ),
                           // Expanded()
                          ],
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

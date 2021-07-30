import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_controller.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController = ScrollController();
  final ListDataX dx = Get.put(ListDataX());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*scrollController.addListener(() {
      if (scrollController.position.hasPixels) {
        dx.httpCall();
      }
    });*/
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListTile(title: Text(dx.doctorList.value.data!.firstName.toString()),)
          /*ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dx.doctorList.value.data!.firstName),
                    onTap: () {
                      print(dx.doctorList.value.data!.email);
                    },
                  );
                },
                itemCount: dx.doctorList.value.data!.length,
              )*/),
            )
            /*Expanded(
              flex: 8,
              child: GetBuilder<ListDataX>(
                builder: (_dx) => ListTile(title: Text(_dx.doctor.firstName.toString()),)
                    ListView.builder(
                  //controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Number: ${_dx.doctor.firstName}'),
                      onTap: () {
                        print(_dx.doctor.email);
                      },
                    );
                }
                ),*/
             // ),
            //),
            /*Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('http request'),
                    onPressed: dx.httpCall,
                  ),
                  ElevatedButton(
                    child: Text('reset'),
                    onPressed: dx.reset,
                  )
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

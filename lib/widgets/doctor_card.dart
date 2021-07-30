import 'package:cached_network_image/cached_network_image.dart';
import 'package:docs_appointment_home/services/doctor_api_model.dart';
import 'package:docs_appointment_home/services/utility.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Datum doc;
  DoctorCard({required this.doc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black
                ),
                child: CachedNetworkImage(
                  imageUrl: doc.avatar,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Palette.primaryGreen
                ),
                child: Image.asset('assets/envelope.png', width: 20, height: 20, color: Palette.docCardButton,),
              )
            ],
          ),
          Column(
            children: [
              Text(doc.firstName),
              Text('yep'),
              Text('yepp'),
              Container()
            ],
          )
        ],
      ),
    );
  }
}

import 'package:docs_appointment_home/services/utility.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  bool selected = false;
  CategoryCard({
    required this.image,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    if(text=='Brain'){
      selected = !selected;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 20),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          width: 120,
          //height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: selected ? Palette.primaryGreen : Colors.transparent,
                blurRadius: 10
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image, width: 70, height: 70,),
              Text(text, style: TextStyle(fontSize: 18, color: selected ? Palette.primaryGreen : Colors.black, fontWeight: selected ? FontWeight.bold : FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}

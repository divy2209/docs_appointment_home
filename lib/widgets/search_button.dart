import 'package:docs_appointment_home/services/utility.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.0, color: Colors.green.shade600.withOpacity(0.3)),
        color: Palette.primaryGreen
      ),
      child: TextButton(
        onPressed: (){

        },
        child: Image.asset('assets/search.png', color: Colors.white60,)
      ),
    );
  }
}

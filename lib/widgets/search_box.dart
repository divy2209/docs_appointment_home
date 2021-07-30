import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 260,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[300]!.withOpacity(0.2)
        ),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              hintText: 'Search Doctor',
              hintStyle: TextStyle()
            ),
          ),
        ),
      ),
    );
  }
}

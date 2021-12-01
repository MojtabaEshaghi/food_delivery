import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(

          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8)),
              enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8,color: Theme.of(context).primaryColor)),
              hintText: 'Search food or Restaurant',
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: (){},
            )
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/widget/appbar.dart';
import 'package:food_delivery/widget/nearby_restaurants.dart';
import 'package:food_delivery/widget/recent_orders.dart';
import 'package:food_delivery/widget/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(),
            RecentOrder(),
            NearbyRestaurants()

          ],
        ),
      ),
    );
  }


}

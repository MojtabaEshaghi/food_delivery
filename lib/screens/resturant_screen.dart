import 'package:flutter/material.dart';
import 'package:food_delivery/models/food.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/widget/rating_stars.dart';

class ResturantScreen extends StatefulWidget {
  final Restaurant restaurant;

  ResturantScreen({required this.restaurant});

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                  image: AssetImage(widget.restaurant.imageUrl),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios),
                      iconSize: 23,
                      color: Colors.white),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.favorite),
                      iconSize: 30,
                      color: Colors.red)
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.restaurant.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    '0.2 miles away',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
              RatingStars(widget.restaurant.rating),
              const SizedBox(height: 8),
              Text(
                widget.restaurant.address,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Reviews",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Contact",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
            )
          ],
        ),
        const Center(
            child: Text(
          "Menu",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, letterSpacing: 1.2),
        )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 2,
          children: List.generate(widget.restaurant.menu.length, (index) {
            Food food = widget.restaurant.menu[index];
            return _buildMenuItem(food);
          }),
        ))
      ],
    ));
  }

  Widget _buildMenuItem(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(food.imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(begin: Alignment.topRight, colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ], stops: const [
                  0.1,
                  0.5,
                  0.6,
                  0.9
                ])),
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${food.price}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                width: 48.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ))
        ],
      ),
    );
  }
}

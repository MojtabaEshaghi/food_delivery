import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/data/data.dart';
import 'package:food_delivery/models/order.dart';

class RecentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Order",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120.0,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
            itemCount: currentUser.orders.length,
            itemBuilder: (ctx, index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(ctx, order);
            },
          ),
        )
      ],
    );
  }

  Widget _buildRecentOrder(BuildContext ctx, Order orders) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[300]!)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage(orders.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        orders.food.name,
                        style: Theme.of(ctx).textTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        orders.restaurant.name,
                        style: Theme.of(ctx)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        orders.date,
                        style: Theme.of(ctx).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
                color: Theme.of(ctx).primaryColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

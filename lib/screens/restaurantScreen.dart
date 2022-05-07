import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/data.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/widgets/ratingStar.dart';

import '../models/food.dart';
import '../models/order.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({required this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  Widget _buildFoodMenu(Food food) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(food.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          height: 170.0,
          width: 170.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black54.withOpacity(0.3),
                Colors.green.withOpacity(0.3),
                Colors.blue.withOpacity(0.3),
                Colors.red.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              food.name,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '\$${food.price}',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                widget.restaurant.imageUrl,
                height: 230.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () =>Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      iconSize: 30.0,
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      iconSize: 35.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0.2 miles',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                RatingStar(widget.restaurant.rating),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text('Reviews'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {},
                child: Text('Contacts'),
              ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Menu',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(5.0),
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildFoodMenu(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

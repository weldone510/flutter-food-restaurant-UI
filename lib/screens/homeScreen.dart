import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/data.dart';
import 'package:fooddeliveryapp/models/restaurant.dart';
import 'package:fooddeliveryapp/screens/restaurantScreen.dart';

import '../widgets/ratingStar.dart';
import '../widgets/recentOrders.dart';
import 'cartScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //Custom Widget
  Widget _buildNearByRestaurant(){
    List<Widget> restaurantList = [];  // first of all we are creating a emply list, then return all data in a list
    restaurants.forEach((Restaurant restaurant) {  // here are are looping from a restaurant for a length
      restaurantList.add(
        GestureDetector(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantScreen(restaurant:restaurant))),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
            decoration:BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.grey.shade100,width: 1.8,),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(restaurant.imageUrl,
                    height: 120.0,
                    width: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.bold,),),
                      SizedBox(height: 6.0,),
                      RatingStar(restaurant.rating),
                      SizedBox(height: 5.0,),
                      Text(restaurant.address,style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),),
                      SizedBox(height: 5.0,),
                      Text('0.2 miles',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery UI',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
        ),
        actions: [
          TextButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen())),
            child: Text('Cart(${currentUser.cart.length})',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search Food or Restaurant',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 0.8,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.close),
                  color: Colors.red,
                ),
              ),
            ),
          ),
          RecentOrders(),   // Call Custom Widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text('Nearby Restaurant',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              _buildNearByRestaurant(),    //call custom Widget
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fooddeliveryapp/data/data.dart';

import '../models/order.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  _RecentOrdersState createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {

  //Custom Widget

  Widget _buildRecentOrders(BuildContext context,Order order){
    return Container(
      width: 320.0,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    order.food.imageUrl,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(order.food.name,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5.0,),
                        Text(order.restaurant.name,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5.0,),
                        Text(order.date,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
            ),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text('Recent Orders',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
          ),
        ),
        Container(
          height: 130.0,
          decoration: BoxDecoration(
            // color: Colors.blue,
          ),
          child: ListView.builder(
            itemCount: currentUser.orders.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,index){
              Order order  = currentUser.orders[index];
              return _buildRecentOrders(context,order);
            },
          ),
        ),
      ],
    );
  }
}

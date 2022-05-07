import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/data.dart';

import '../models/order.dart';

class CartScreen extends StatefulWidget {

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Widget _buildCartItems(Order item){
    return Container(
      height: 150.0,
      padding: EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(item.food.imageUrl,
                    height: 120.0,
                    width: 120.0,
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
                        Text(item.food.name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,),),
                        SizedBox(height: 6.0,),
                        Text(item.restaurant.name,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,),),
                        SizedBox(height: 6.0,),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('-',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                              SizedBox(width: 20.0,),
                              Text(item.quantity.toString(),style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                              SizedBox(width: 20.0,),
                              Text('+',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Text('\$${item.food.price}',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600,color: Colors.deepOrange),),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    double totalPrice = 0;
   currentUser.cart.forEach((Order order) {
     totalPrice = totalPrice + order.quantity*order.food.price;   // Total price for all items in our cart
   });
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart(${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context,int index){
         if(index<currentUser.cart.length){
           Order order = currentUser.cart[index];
           return _buildCartItems(order);
         }
         return Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Text('Estimated Delivery Time',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600),),
                   Text('25 mins',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600),),
                 ],
               ),
               SizedBox(height: 10.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Total Costs',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600),),
                   Text('\$${totalPrice.toStringAsFixed(2)}',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor),),
                 ],
               ),
               SizedBox(height: 80.0,),
             ],
           ),
         );
        },
        separatorBuilder: (BuildContext context,int index){
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 6.0,
              offset: Offset(0,-1),
            ),
          ],
        ),
        child: TextButton(
          onPressed: (){},
          child: Text('CHECKOUT',style: TextStyle(fontSize: 22.0,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 0.8),),
        ),
      ),
    );
  }
}

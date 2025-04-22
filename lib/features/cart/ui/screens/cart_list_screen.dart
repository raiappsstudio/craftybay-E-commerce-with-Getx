import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/cartlist_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  static const String name = '/cartlist';

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index){
                return const FittedBox(child:CartListItem());
              }),
            ),

            _buildCartCheckOut()

          ],
        ),
      ),
    );
  }

  Widget _buildCartCheckOut() {
    return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.1),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Total Price",style: TextStyle(fontSize: 18),),
                Text("\$1000",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.themeColor),),
              ],),

              SizedBox(
                width: 140,
                  child: ElevatedButton(onPressed: (){}, child: Text("CheckOut")))
            ],
          ),


        );
  }
}


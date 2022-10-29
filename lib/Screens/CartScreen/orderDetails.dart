import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {

  Map product;

  OrderDetails(this.product);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(44, 53, 57, 1),
        appBar: AppBar(
        title: const Text('Details'),
          backgroundColor: Color.fromRGBO(44, 53, 57, 1),
      ),
      body:Center(
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
            ),
            child: ListView(
              children: [
                const Text('Name',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text(widget.product['customer_name'],style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                const SizedBox(height: 15,),
                const Text('Address',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),

                Text(widget.product['address'],style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                const SizedBox(height: 15,),
                const Text('Land Mark',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),

                Text(widget.product['land_mark'],style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                const SizedBox(height: 15,),
                const Text('City',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text('${widget.product['city']}- ${widget.product['pin_code']}',style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                const SizedBox(height: 15,),
                const Text('Phone Number',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text(widget.product['mob_num'],style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                const Text('Quantity',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text(widget.product['quantity'].toString(),style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                const Text('Total',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text(widget.product['total'].toString(),style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                const Text('Payment method',style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),),
                const SizedBox(height: 5,),
                Text(widget.product['payment_method'],style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                SizedBox(height: 20,),
                Center(
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blueGrey,
                      child:Text('Deliver Product',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500)) ,
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      )

    );
  }
}

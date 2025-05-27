import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }

/*  Future<void> paymentGetwayIntrigration(double totalPrice) async {
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            //   ipn_url: "www.ipnurl.com",
            multi_card_name: "visa,master,bkash",
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "topwa6835dec9a414d",
            store_passwd: "topwa6835dec9a414d@ssl",
            total_amount: totalPrice,
            tran_id: "custom_transaction_idxxxteeeesssxxxxxx"));

    final response = await sslcommerz.payNow();

    if (response.status = 'VALID') {
      print('Payment successfully');
    }

    if (response.status = 'Closed') {
      print('Payment closed');
    }

    if (response.status = 'FAILED') {
      print('Payment Failed');
    }
  }*/
}

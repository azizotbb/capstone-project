import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/payment/bloc/payment_bloc.dart';
import 'package:makfoul_app/screen/payment/orderwating.dart';
import 'package:moyasar/moyasar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<PaymentBloc>();
          return BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(title: Text('Payment')),
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CreditCard(
                    config: bloc.paymentConfig,
                    onPaymentResult: (result) {
                      if (result is PaymentResponse) {
                        switch (result.status) {
                          case PaymentStatus.paid:
                            print('####################${result.status}');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Orderwaiting(),
                              ),
                            );
                            break;
                          case PaymentStatus.failed:

                            // handle failure.
                            break;
                          case PaymentStatus.initiated:
                            // TODO: Handle this case.
                            throw UnimplementedError();
                          case PaymentStatus.authorized:
                            // TODO: Handle this case.
                            throw UnimplementedError();
                          case PaymentStatus.captured:
                            // TODO: Handle this case.
                            throw UnimplementedError();
                        }
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Text("Payment", style: AppTextStyle.textTitleLarg24dark),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 50, right: 22, left: 22),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomTextField(setHint: 'Cardholder Name'),
//             SizedBox(height: 12),
//             CustomTextField(setHint: 'Card Number'),
//             SizedBox(height: 12),
//             Row(
//               children: [
//                 Expanded(child: CustomTextField(setHint: 'Expiration')),
//                 SizedBox(width: 12),
//                 Expanded(child: CustomTextField(setHint: 'CVV')),
//               ],
//             ),
//             Spacer(),
//             PrimryCustomButton(
//               setText: 'Pay',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Orderwaiting()),
//                 );
//               },
//             ),
//             SizedBox(height: 50),
//           ],
//         ),
//       ),
    // );
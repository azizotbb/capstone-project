import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:makfoul_app/screen/payment/bloc/payment_bloc.dart';
import 'package:makfoul_app/screen/payment/orderwating.dart';
import 'package:moyasar/moyasar.dart';

// A screen that handles payment using Moyasar and BLoC
class PaymentScreen extends StatelessWidget {
  final int courseId;
  final int amount;
  const PaymentScreen({
    super.key,
    required this.courseId,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    // Create payment configuration using Moyasar
    final paymentConfig = PaymentConfig(
      publishableApiKey: dotenv.env["moyasarKey"].toString(),
      amount: amount,
      description: 'order #1324',
      metadata: {'size': '250g'},
      creditCard: CreditCardConfig(saveCard: false, manual: false),
    );
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
                    config: paymentConfig,
                    onPaymentResult: (result) {
                      if (result is PaymentResponse) {
                        switch (result.status) {
                          // If payment is successful, dispatch event and navigate to waiting screen
                          case PaymentStatus.paid:
                            bloc.add(PaymentPaidEvent(courseId: courseId));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Orderwaiting(),
                              ),
                            );
                            break;
                          // If payment failed, show error message

                          case PaymentStatus.failed:
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red[400],
                                content: Text(
                                  "Payment failed. Please try again or use a different payment method."
                                      .tr(),
                                ),
                              ),
                            );
                            break;
                          case PaymentStatus.initiated:
                            throw UnimplementedError();
                          case PaymentStatus.authorized:
                            throw UnimplementedError();
                          case PaymentStatus.captured:
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
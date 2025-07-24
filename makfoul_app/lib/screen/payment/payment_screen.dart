import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makfoul_app/screen/payment/bloc/payment_bloc.dart';
import 'package:makfoul_app/screen/payment/web_view_page.dart';
import 'package:makfoul_app/utility/validators.dart';
import 'package:makfoul_app/widget/shared/custom_Text_field.dart';
import 'package:makfoul_app/widget/shared/primry_custom_button.dart';

// A screen that handles payment using Moyasar and BLoC
class PaymentScreen extends StatelessWidget {
  final int courseId;
  final int amount;
  PaymentScreen({super.key, required this.courseId, required this.amount});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaymentBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('payment'.tr())),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<PaymentBloc, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccessState) {
                if (state.transactionUrl != null &&
                    state.transactionUrl.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WebViewpage(url: state.transactionUrl),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('link'.tr())),
                  );
                  context.read<PaymentBloc>().emit(PaymentInitial());
                }
              } else if (state is PaymentErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.msg)));
              }
            },
            builder: (context, state) {
              final bloc = context.read<PaymentBloc>();
              if (state is PaymentLodingState) {
                return Center(child: CircularProgressIndicator());
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      setHint: 'Cardholder Name'.tr(),
                      controller: bloc.nameCtrl,
                      validator: (value) {
                        return Validators.validteNamePayment(value!);
                      },
                    ),
                    SizedBox(height: 12),
                    CustomTextField(
                      setHint: 'Card Number'.tr(),
                      controller: bloc.numCtrl,
                      validator: (value) {
                        return Validators.validateCardNumber(value!);
                      },
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            setHint: 'month'.tr(),
                            controller: bloc.monthCtrl,
                            validator: (value) {
                              return Validators.validateMonth(value!);
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            setHint: 'year'.tr(),
                            controller: bloc.yearCtrl,
                            validator: (value) {
                              return Validators.valaditeYear(value!);
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            setHint: 'CVV'.tr(),
                            controller: bloc.cvvCtrl,
                            validator: (value) {
                              return Validators.validateCvv(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    PrimryCustomButton(
                      setText: 'Pay'.tr(),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(
                            SubmitPaymentEvent(
                              bloc.nameCtrl.text,
                              bloc.numCtrl.text,
                              bloc.monthCtrl.text,
                              bloc.yearCtrl.text,
                              bloc.cvvCtrl.text,
                              amount,
                              courseId: courseId,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}




//   Widget build(BuildContext context) {
//     // Create payment configuration using Moyasar
//     final paymentConfig = PaymentConfig(
//       publishableApiKey: dotenv.env["moyasarKey"].toString(),
//       amount: amount,
//       description: 'order #1324',
//       // metadata: {'size': '250g'},
//       creditCard: CreditCardConfig(saveCard: false, manual: false),
//     );
//     return BlocProvider(
//       create: (context) => PaymentBloc(),
//       child: Builder(
//         builder: (context) {
//           final bloc = context.read<PaymentBloc>();
//           return BlocBuilder<PaymentBloc, PaymentState>(
//             builder: (context, state) {
//               return Scaffold(
//                 appBar: AppBar(title: Text('Payment')),
//                 body: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: CreditCard(
//                     config: paymentConfig,
//                     onPaymentResult: (result) {
//                       if (result is PaymentResponse) {
//                         switch (result.status) {
//                           // If payment is successful, dispatch event and navigate to waiting screen
//                           case PaymentStatus.paid:
//                             bloc.add(PaymentPaidEvent(courseId: courseId));
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Orderwaiting(),
//                               ),
//                             );
//                             break;
//                           // If payment failed, show error message

//                           case PaymentStatus.failed:
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 backgroundColor: Colors.red[400],
//                                 content: Text(
//                                   "Payment failed. Please try again or use a different payment method."
//                                       .tr(),
//                                 ),
//                               ),
//                             );
//                             break;
//                           case PaymentStatus.initiated:
//                             throw UnimplementedError();
//                           case PaymentStatus.authorized:
//                             throw UnimplementedError();
//                           case PaymentStatus.captured:
//                             throw UnimplementedError();
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

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
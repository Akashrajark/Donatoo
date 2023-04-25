import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_requests/manage_requests_bloc.dart';
import 'package:donatoo/ui/screens/create_request.dart';
import 'package:donatoo/ui/widget/custom_action_button.dart';
import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/custom_alert_dialog.dart';
import '../widget/custom_label.dart';
import '../widget/custom_dialog.dart';

class RequestDetails extends StatefulWidget {
  final Map<String, dynamic> details;
  final ManageRequestBloc manageRequestBloc;
  const RequestDetails(
      {super.key, required this.details, required this.manageRequestBloc});

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  final Razorpay _razorpay = Razorpay();
  int amount = 0;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await showDialog(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: 'Payment Success',
        message: 'Thank you for the payment. Reopen the page to see changes',
        primaryButtonLabel: 'Ok',
      ),
    );

    widget.manageRequestBloc
        .add(PayRequestEvent(requestId: widget.details['id'], amount: amount));

    Navigator.pop(context);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Logger().e(response.error);
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Payment Failed',
        message: response.message ?? 'Something went wrong, Please try again',
        primaryButtonLabel: 'Ok',
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void makePayment() async {
    // String orderId = await createOrder(widget.testDetails['total_price']);

    var options = {
      'key': 'rzp_test_j07YpjyCexi5xr',
      'amount': amount * 100,
      'name': 'Donatoo',
      // 'order_id': orderId,
      'description': widget.details['title'],
      'prefill': {
        'contact': '7012874004',
        'email': Supabase.instance.client.auth.currentUser!.email,
      }
    };
    Logger().w(options);
    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CustomDialog(),
              );
            },
            icon: const Icon(Icons.report),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.details['image'],
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.details['title'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Created by",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.details['user']['name'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.details['description'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomLabel(
                          titleText: "₹${widget.details['total_payment']}",
                          descriptionText:
                              "of ₹${widget.details['amount_required'] - widget.details['amount_collected']}",
                          color: Colors.green,
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: CustomLabel(
                            titleText:
                                widget.details['payments'].length.toString(),
                            descriptionText: "Donators",
                            color: Colors.deepPurple,
                          )),
                      Expanded(
                        flex: 3,
                        child: CustomLabel(
                          alignment: CrossAxisAlignment.end,
                          titleText: DateFormat('dd/MM/yyyy').format(
                              DateTime.parse(widget.details['duedate'])),
                          descriptionText: "Due Date",
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LinearProgressIndicator(
                    value: widget.details['total_payment'] /
                        (widget.details['amount_required'] -
                            widget.details['amount_collected']),
                    backgroundColor: Colors.black12,
                    color: widget.details['total_payment'] /
                                (widget.details['amount_required'] -
                                    widget.details['amount_collected']) <
                            .5
                        ? Colors.deepOrange
                        : Colors.green,
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Text(
                    'Patient Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.details['patient_name'],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.details['patient_address_line'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            widget.details['patient_place'] +
                                ', ' +
                                widget.details['patient_district'] +
                                ', ' +
                                widget.details['patient_state'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            widget.details['patient_pincode'].toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      final Uri url =
                          Uri.parse('tel:' + widget.details['patient_phone']);
                      launchUrl(url);
                    },
                    icon: const Icon(Icons.call),
                    label: Text(widget.details['patient_phone']),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Hospital Details',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.details['hospital_name'],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.details['hospital_address_line'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            widget.details['hospital_place'] +
                                ', ' +
                                widget.details['hospital_district'] +
                                ', ' +
                                widget.details['hospital_state'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            widget.details['hospital_pincode'].toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () {
                      final Uri url =
                          Uri.parse('tel:' + widget.details['hospital_phone']);
                      launchUrl(url);
                    },
                    icon: const Icon(Icons.call),
                    label: Text(widget.details['hospital_phone']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Padding(
          padding: widget.details['status'] == 'pending' ||
                  widget.details['status'] == 'active'
              ? const EdgeInsets.symmetric(horizontal: 10, vertical: 15)
              : EdgeInsets.zero,
          child: widget.details['user_id'] !=
                  Supabase.instance.client.auth.currentUser!.id
              ? CustomButton(
                  text: "Donate",
                  onTap: () async {
                    amount = (await showDialog(
                          context: context,
                          builder: (context) => AmountForm(
                            limit: widget.details['amount_required'] -
                                widget.details['amount_collected'] -
                                widget.details['total_payment'],
                          ),
                        )) ??
                        0;

                    if (amount != 0) {
                      makePayment();
                      Logger().w(amount.toString());
                    }
                  })
              : widget.details['status'] == 'pending' ||
                      widget.details['status'] == 'active'
                  ? Row(
                      children: [
                        Expanded(
                          child: CustomActionButton(
                            color: Colors.orange,
                            iconData: Icons.edit,
                            label: 'Edit',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => CreateRequest(
                                    manageRequestBloc: widget.manageRequestBloc,
                                    details: widget.details,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomActionButton(
                            color: Colors.green,
                            iconData: Icons.done,
                            label: 'Completed',
                            onPressed: () {
                              widget.manageRequestBloc.add(
                                  UpdateRequestStatusEvent(
                                      status: 'completed',
                                      requestId: widget.details['id']));

                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomActionButton(
                            color: Colors.red,
                            iconData: Icons.close,
                            label: 'Close',
                            onPressed: () {
                              widget.manageRequestBloc.add(
                                  UpdateRequestStatusEvent(
                                      status: 'closed',
                                      requestId: widget.details['id']));

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}

class AmountForm extends StatefulWidget {
  final int limit;
  const AmountForm({
    super.key,
    required this.limit,
  });

  @override
  State<AmountForm> createState() => _AmountFormState();
}

class _AmountFormState extends State<AmountForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Enter Amount',
      message: 'Enter the amount you wish to donate,',
      content: Form(
        key: formKey,
        child: TextFormField(
          controller: _amountController,
          validator: (value) {
            if (value != null && value.trim().isNotEmpty) {
              if (int.parse(value) <= widget.limit) {
                return null;
              } else {
                return 'Amount cannot be greater than ${widget.limit}';
              }
            } else {
              return 'Enter amount to continue';
            }
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.money),
            hintText: 'Donation Amaount',
          ),
        ),
      ),
      primaryButtonLabel: 'Ok',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(context, int.parse(_amountController.text.trim()));
        }
      },
    );
  }
}

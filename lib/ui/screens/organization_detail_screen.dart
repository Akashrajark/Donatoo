import 'package:cached_network_image/cached_network_image.dart';
import 'package:donatoo/bloc/manage_organizations/manage_organizations_bloc.dart';
import 'package:donatoo/ui/widget/custom_alert_dialog.dart';
import 'package:donatoo/ui/widget/custom_button.dart';
import 'package:donatoo/values/colors.dart';
import 'package:donatoo/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../widget/custom_label.dart';
import '../widget/custom_dialog.dart';

class OrganizationDetails extends StatefulWidget {
  final dynamic organisationDetails;
  final ManageOrganizationsBloc manageOrganizationsBloc;
  const OrganizationDetails({
    super.key,
    required this.organisationDetails,
    required this.manageOrganizationsBloc,
  });

  @override
  State<OrganizationDetails> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetails> {
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

    widget.manageOrganizationsBloc.add(PayOrganizationEvent(
        id: widget.organisationDetails['id'], amount: amount));

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
      'description': widget.organisationDetails['name'],
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
        leading: Material(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(borderRadius),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: secondaryColor,
            ),
          ),
        ),
        actions: [
          Center(
            child: Material(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(borderRadius),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CustomDialog(),
                  );
                },
                color: Colors.deepOrange,
                icon: const Icon(Icons.report),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.organisationDetails['photo'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.organisationDetails['name'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.organisationDetails['category'],
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black45,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.organisationDetails['address_line'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
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
                            widget.organisationDetails['place'] +
                                ', ' +
                                widget.organisationDetails['state'] +
                                ', ' +
                                widget.organisationDetails['district'],
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
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
                            widget.organisationDetails['pincode'].toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.organisationDetails['about_org'],
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Colors.black,
                              ),
                    ),
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.deepPurple,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              widget.organisationDetails['email'],
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.deepPurple,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.deepPurple,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              widget.organisationDetails['phone'],
                              textAlign: TextAlign.start,
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLabel(
                        titleText:
                            '₹${widget.organisationDetails['total_payment']}',
                        descriptionText: "Funded",
                        color: Colors.green,
                      ),
                      CustomLabel(
                        alignment: CrossAxisAlignment.end,
                        titleText: widget.organisationDetails['payments'].length
                            .toString(),
                        descriptionText: "Donations",
                        color: Colors.deepPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          text: "Donate",
          onTap: () async {
            amount = (await showDialog(
                  context: context,
                  builder: (context) => const AmountForm(),
                )) ??
                0;

            if (amount != 0) {
              makePayment();
              Logger().w(amount.toString());
            }
          },
        ),
      ),
    );
  }
}

class AmountForm extends StatefulWidget {
  const AmountForm({
    super.key,
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
              return null;
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

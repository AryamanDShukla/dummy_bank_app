import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/text.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = 'FAQScreen';

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQItem> faqs = [
    FAQItem(
      question: 'How do I open a bank account?',
      answer:
      'To open a bank account, visit any of our branches with your valid identification documents and fill out the account opening form. Our staff will guide you through the process.',
    ),
    FAQItem(
      question: 'What documents do I need to open a bank account?',
      answer:
      'You will need to provide proof of identity (such as Aadhar card, passport, or driver\'s license), proof of address (such as utility bills or rental agreement), and passport-size photographs.',
    ),
    FAQItem(
      question: 'How can I check my account balance?',
      answer:
      'You can check your account balance through our mobile banking app, internet banking portal, or by visiting any of our ATM machines.',
    ),
    FAQItem(
      question: 'How do I apply for a loan?',
      answer:
      'To apply for a loan, fill out the loan application form available at our branches or apply online through our website. Our loan officers will review your application and guide you through the rest of the process.',
    ),
    FAQItem(
      question: 'What are the interest rates for loans?',
      answer:
      'Interest rates for loans vary depending on the type of loan, loan amount, and repayment tenure. Please visit our website or contact our customer service for current interest rates.',
    ),
    FAQItem(
      question: 'How can I report a lost or stolen card?',
      answer:
      'If your debit or credit card is lost or stolen, immediately contact our customer service helpline to report it. Our representatives will assist you in blocking the card and issuing a replacement.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Frequently Asked Questions',
          style: MyTextStyle.largeText,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(1.3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: faqs.map((faq) => FAQItemWidget(faq)).toList(),
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

class FAQItemWidget extends StatefulWidget {
  final FAQItem faqItem;

  FAQItemWidget(this.faqItem);

  @override
  _FAQItemWidgetState createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Container(
        padding: EdgeInsets.all(1.3.h),
        margin: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(1.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.faqItem.question,
              style: MyTextStyle.smallMedium.copyWith(fontWeight: FontWeight.w500),
            ),
            if (_expanded)
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(widget.faqItem.answer),
              ),
          ],
        ),
      ),
    );
  }
}

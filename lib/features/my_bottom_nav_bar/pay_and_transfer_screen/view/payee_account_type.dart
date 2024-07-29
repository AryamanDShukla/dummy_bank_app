import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/text.dart';
import 'difr_account_type_body/hsbc_account.dart';



class PayeeAccountType extends StatefulWidget {
  static const String routeName = 'PayeeAccountType';
  const PayeeAccountType({Key? key}) : super(key: key);

  @override
  State<PayeeAccountType> createState() => _PayeeAccountTypeState();
}

class _PayeeAccountTypeState extends State<PayeeAccountType> {
  String? selectedAccountType;

  void _showAccountTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(1.5.h)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 1.3.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.4.h), color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select a payee account type',
                        style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                _buildAccountTypeItem('HSBC account'),
                _buildAccountTypeItem('Non-HSBC account'),
                _buildAccountTypeItem('HSBC credit card'),
                _buildAccountTypeItem('Mobile'),
                _buildAccountTypeItem('Passport'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountTypeItem(String accountType) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedAccountType = accountType;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              size: 2.2.h,
              color: selectedAccountType == accountType ? Colors.blue.shade800 : Colors.grey.shade400,
            ),
            SizedBox(width: 2.5.w),
            Text(
                accountType,
                style: MyTextStyle.smallText.copyWith(
                    color: selectedAccountType == accountType ? Colors.blue.shade700 : Colors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Move Money',
          style: MyTextStyle.largeText,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                _showAccountTypeBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payee account type',
                            style: MyTextStyle.mediumText.copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 0.3.h),
                          Text(selectedAccountType ?? 'Select a payee account type', style: MyTextStyle.smallText),
                        ],
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 3.3.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h),
            if (selectedAccountType != null) ..._buildAccountSpecificFields(selectedAccountType!),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAccountSpecificFields(String accountType) {
    switch (accountType) {
      case 'HSBC account':
        return [HSBCAccount()];
      case 'Non-HSBC account':
        return [HSBCAccount()];
      case 'HSBC credit card':
        return [HSBCAccount()];
      case 'Mobile':
        return [HSBCAccount()];
      case 'Passport':
        return [HSBCAccount()];
      default:
        return [];
    }
  }


  List<Widget> _buildNonHSBCAccountFields() {
    return [
      _buildTextField('From Account'),
      _buildTextField('To Account'),
      _buildTextField('Amount'),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Review button pressed
        },
        child: Text('Review'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          // Proceed button pressed
        },
        child: Text('Proceed'),
      ),
    ];
  }

  List<Widget> _buildHSCBCreditCardFields() {
    return [
      _buildTextField('Credit Card Number'),
      _buildTextField('Account Number'),
      _buildTextField('CVV Number'),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Review button pressed
        },
        child: Text('Review'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          // Proceed button pressed
        },
        child: Text('Proceed'),
      ),
    ];
  }

  List<Widget> _buildMobileFields() {
    return [
      _buildTextField('From Account'),
      _buildTextField('To Account'),
      _buildTextField('Amount'),
      _buildTextField('Code'),
      _buildTextField('CVV'),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Review button pressed
        },
        child: Text('Review'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          // Proceed button pressed
        },
        child: Text('Proceed'),
      ),
    ];
  }

  List<Widget> _buildPassportFields() {
    return [
      _buildTextField('Passport Number'),
      _buildTextField('Country'),
      _buildTextField('Country Code'),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          // Review button pressed
        },
        child: Text('Review'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          // Proceed button pressed
        },
        child: Text('Proceed'),
      ),
    ];
  }

  Widget _buildTextField(String labelText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

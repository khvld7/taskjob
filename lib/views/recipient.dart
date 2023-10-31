import 'package:flutter/material.dart';
import 'package:taskjob/components/custom_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

final searchRecipienController = TextEditingController();
final nameRecipientController = TextEditingController();
final emailRecipientController = TextEditingController();
final phoneRecipientController = TextEditingController();
final countryRecipientController = TextEditingController();
final cityRecipientController = TextEditingController();
final addressRecipientController = TextEditingController();
final postcodeRecipientController = TextEditingController();

bool isSelectAddress = false;
bool isSelectAddressRecipient = false;

class Recipient extends StatefulWidget {
  const Recipient({Key? key}) : super(key: key);

  @override
  State<Recipient> createState() => _RecipientState();
}

class _RecipientState extends State<Recipient> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          child: Text(
            'Recipient address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(36),
                  color: !isSelectAddressRecipient
                      ? Color.fromRGBO(234, 86, 13, 1)
                      : Color.fromRGBO(231, 236, 240, 1)),
              child: RawMaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => setState(() {
                  if (isSelectAddressRecipient) {
                    isSelectAddressRecipient = !isSelectAddressRecipient;
                  }
                }),
                child: Text(
                  'Add address',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: !isSelectAddressRecipient
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color.fromRGBO(145, 158, 171, 1),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 33,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(36),
                  color: isSelectAddressRecipient
                      ? Color.fromRGBO(234, 86, 13, 1)
                      : Color.fromRGBO(231, 236, 240, 1)),
              child: RawMaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => setState(() {
                  if (!isSelectAddressRecipient) {
                    isSelectAddressRecipient = !isSelectAddressRecipient;
                  }
                }),
                child: Text(
                  'Select address',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: isSelectAddressRecipient
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color.fromRGBO(145, 158, 171, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        !isSelectAddressRecipient
            ? Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full name*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        onChanged: (value) {
                          value = nameRecipientController.value.text;
                        },
                        controller: nameRecipientController,
                        keyboardType: TextInputType.multiline,
                        hintText: 'Enter your name',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/postcode.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      'Email*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(169, 181, 193, 1),
                            width: 0.5),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          emailRecipientController.value.text;
                        },
                        controller: emailRecipientController,
                        hintText: 'Enter your Email',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/email.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      'Phone number*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.phone,
                        controller: phoneRecipientController,
                        onChanged: (value) {
                          phoneRecipientController.value.text;
                        },
                        hintText: 'Enter your number',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/phone.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: Color.fromRGBO(231, 236, 240, 1),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Country*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.multiline,
                        controller: countryRecipientController,
                        onChanged: (String value) {
                          countryRecipientController.value.text;
                        },
                        hintText: 'Enter your country',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/location.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      'City*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.multiline,
                        controller: cityRecipientController,
                        onChanged: (value) {
                          cityRecipientController.value.text;
                        },
                        hintText: 'Enter your city',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/location_city.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Text(
                      'Address line 1*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width / 50,
                          MediaQuery.of(context).size.height / 90,
                          MediaQuery.of(context).size.width / 50,
                          0),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.multiline,
                        controller: addressRecipientController,
                        onChanged: (value) {
                          addressRecipientController.value.text;
                        },
                        hintText: 'Enter your address',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/location_address.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    RawMaterialButton(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 60),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      child: Text(
                        'Add address line +',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(234, 86, 13, 1),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Text(
                      'Postcode*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(50, 63, 75, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: postcodeRecipientController,
                        onChanged: (value) {
                          postcodeRecipientController.value.text;
                        },
                        hintText: 'Enter your postcode',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/postcode.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 90),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(169, 181, 193, 1),
                              width: 0.5),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 50,
                        vertical: MediaQuery.of(context).size.height / 90,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: CustomTextField(
                        keyboardType: TextInputType.multiline,
                        controller: searchRecipienController,
                        onChanged: (value) {
                          searchRecipienController.value.text;
                        },
                        hintText: 'Enter your city',
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/search.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 90,
                        horizontal: MediaQuery.of(context).size.width / 50,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 32, 39, 1),
                            border: Border.all(width: 0.5),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12)),
                        child: RawMaterialButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                                child: Text(
                                  nameRecipientController.value.text,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                    child: Text(
                                      '${countryRecipientController.text} , ${cityRecipientController.text}, ${addressRecipientController.text}, ${postcodeRecipientController.text}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

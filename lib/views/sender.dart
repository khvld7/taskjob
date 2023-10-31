import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskjob/views/recipient.dart';
import '../components/custom_textfield.dart';

class Sender extends StatefulWidget {
  const Sender({Key? key}) : super(key: key);

  @override
  State<Sender> createState() => _SenderState();
}

class _SenderState extends State<Sender> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 3,
        padding: EdgeInsets.only(
          top: 6,
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  final nameSenderController = TextEditingController();
  final emailSenderController = TextEditingController();
  final phoneSenderController = TextEditingController();
  final countrySenderController = TextEditingController();
  final citySenderController = TextEditingController();
  final addressSenderController = TextEditingController();
  final postcodeSenderController = TextEditingController();
  final searchSenderController = TextEditingController();

  late String _select;
  var formatterDateNow;
  var formatter = DateFormat.yMMMMd('en_US');
  late DateTime date;

  @override
  void initState() {
    date = DateTime.now();
    formatterDateNow = DateFormat().add_yMMMd().format(date);
    _select = formatterDateNow.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Colors.black,
          size: 35,
        ),
        shadowColor: Color.fromRGBO(231, 236, 240, 1),
        elevation: 0.5,
        backgroundColor: Color.fromRGBO(251, 251, 251, 1),
        title: Text(
          'Ordering',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(23, 32, 39, 1),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 30,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 70,
            ),
            child: Center(
              child: Text(
                'Step 1',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(23, 32, 39, 1)),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 70,
                  ),
                  child: Text(
                    'Start date',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 50,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(169, 181, 193, 1), width: 0.5),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12)),
                  child: RawMaterialButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.calendarDays,
                          color: Color.fromRGBO(103, 116, 130, 1),
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Text(
                            _select,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      _showDialog(
                        CupertinoDatePicker(
                          dateOrder: DatePickerDateOrder.mdy,
                          initialDateTime: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() => _select = formatter.format(newDate));
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40),
                child: Text(
                  'Sender details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 33,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(36),
                              color: !isSelectAddress
                                  ? Color.fromRGBO(234, 86, 13, 1)
                                  : Color.fromRGBO(231, 236, 240, 1)),
                          child: RawMaterialButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () => setState(() {
                              ;
                              if (isSelectAddress) {
                                isSelectAddress = !isSelectAddress;
                              }
                            }),
                            child: Text(
                              'Add address',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: !isSelectAddress
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
                              color: isSelectAddress
                                  ? Color.fromRGBO(234, 86, 13, 1)
                                  : Color.fromRGBO(231, 236, 240, 1)),
                          child: RawMaterialButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () => setState(() {
                              if (!isSelectAddress) {
                                isSelectAddress = !isSelectAddress;
                              }
                            }),
                            child: Text(
                              'Select address',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: isSelectAddress
                                    ? Color.fromRGBO(255, 255, 255, 1)
                                    : Color.fromRGBO(145, 158, 171, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  !isSelectAddress
                      ? Column(
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                onChanged: (value) {
                                  value = nameSenderController.value.text;
                                },
                                controller: nameSenderController,
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  emailSenderController.value.text;
                                },
                                controller: emailSenderController,
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                keyboardType: TextInputType.phone,
                                controller: phoneSenderController,
                                onChanged: (value) {
                                  phoneSenderController.value.text;
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                keyboardType: TextInputType.multiline,
                                controller: countrySenderController,
                                onChanged: (String value) {
                                  countrySenderController.value.text;
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                keyboardType: TextInputType.multiline,
                                controller: citySenderController,
                                onChanged: (value) {
                                  citySenderController.value.text;
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
                                controller: addressSenderController,
                                onChanged: (value) {
                                  addressSenderController.value.text;
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
                                horizontal:
                                    MediaQuery.of(context).size.width / 50,
                                vertical:
                                    MediaQuery.of(context).size.height / 90,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: CustomTextField(
                                keyboardType: TextInputType.number,
                                controller: postcodeSenderController,
                                onChanged: (value) {
                                  postcodeSenderController.value.text;
                                },
                                hintText: 'Enter your postcode',
                                prefixIcon: SvgPicture.asset(
                                  'assets/icons/postcode.svg',
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ],
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
                                  horizontal:
                                      MediaQuery.of(context).size.width / 50,
                                  vertical:
                                      MediaQuery.of(context).size.height / 90,
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: CustomTextField(
                                  controller: searchSenderController,
                                  onChanged: (value) {
                                    searchSenderController.value.text;
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
                                  vertical:
                                      MediaQuery.of(context).size.height / 90,
                                  horizontal:
                                      MediaQuery.of(context).size.width / 50,
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
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 15, 15, 10),
                                          child: Text(
                                            nameSenderController.text,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 0, 15, 0),
                                              child: Text(
                                                '${countrySenderController.text} , ${citySenderController.text}, ${addressSenderController.text}, ${postcodeSenderController.text}',
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
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Container(
                      child: Recipient(),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 70,
                50, MediaQuery.of(context).size.width / 70, 50),
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(234, 86, 13, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: RawMaterialButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {},
                  child: Text(
                    'Next step',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

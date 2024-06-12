import 'package:flutter/material.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Enter your Phone Number",
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Text("WhatsApp will send an SMS message to verify your number"),
            CountryCard()
          ],
        ),
      ),
    );
  }
  Widget CountryCard(){
    return Container();
  }
}

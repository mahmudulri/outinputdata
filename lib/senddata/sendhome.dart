import 'package:flutter/material.dart';
import 'package:ouripdata/senddata/sheetscolumn.dart';

import 'googlesheet.dart';

class SendToSheet extends StatefulWidget {
  const SendToSheet({Key? key}) : super(key: key);

  @override
  _SendToSheetState createState() => _SendToSheetState();
}

class _SendToSheetState extends State<SendToSheet> {
  TextEditingController vpnnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ipaddressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: vpnnameController,
              ),
              TextFormField(
                controller: countryController,
              ),
              TextFormField(
                controller: ipaddressController,
              ),
              TextFormField(
                controller: dateController,
              ),
              TextFormField(
                controller: numberController,
              ),
              GestureDetector(
                onTap: () async {
                  final feedback = {
                    SheetsColumn.vpnname: vpnnameController.text.trim(),
                    SheetsColumn.country: countryController.text.trim(),
                    SheetsColumn.ipaddress: ipaddressController.text.trim(),
                    SheetsColumn.date: dateController.text.trim(),
                    SheetsColumn.number: numberController.text.trim(),
                  };

                  await SheetsFlutter.insert([feedback]);
                },
                child: Container(
                  height: 70,
                  width: 400,
                  color: Colors.red,
                  child: Center(child: Text("Send to Sheets")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ouripdata/senddata/googlesheet.dart';
import 'package:ouripdata/senddata/sheetscolumn.dart';
import 'package:intl/intl.dart';

import 'datacontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  DataController regularController = Get.put(DataController());

  TextEditingController vpnnameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ipaddressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(DateFormat.yMd().format(DateTime.now()));
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Add Data Now"),
              content: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                    width: screenWidth,
                    child: TextField(
                      controller: vpnnameController,
                      decoration: InputDecoration(hintText: "VPN Name"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                    width: screenWidth,
                    child: TextField(
                      controller: countryController,
                      decoration: InputDecoration(hintText: "Country"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                    width: screenWidth,
                    child: TextField(
                      controller: ipaddressController,
                      decoration: InputDecoration(hintText: "IP Address"),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       width: 1,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   height: 50,
                  //   width: screenWidth,
                  //   child: TextField(
                  //     controller: dateController,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       hintText: "Date",
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    height: 50,
                    width: screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "IP No",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () async {
                      final feedback = {
                        SheetsColumn.vpnname: vpnnameController.text.trim(),
                        SheetsColumn.country: countryController.text.trim(),
                        SheetsColumn.ipaddress: ipaddressController.text.trim(),
                        SheetsColumn.date:
                            DateFormat.yMd().format(DateTime.now()).trim(),
                        SheetsColumn.number: numberController.text.trim(),
                      };

                      await SheetsFlutter.insert([feedback]);
                      Navigator.of(ctx).pop();
                      vpnnameController.clear();
                      countryController.clear();
                      ipaddressController.clear();
                      dateController.clear();
                      numberController.clear();
                    },
                    child: Container(
                      color: Colors.green,
                      padding: const EdgeInsets.all(14),
                      child: const Text(
                        "Add Now",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: [
            Expanded(child: Obx(() {
              if (regularController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 3,
                    );
                  },
                  itemCount: regularController.allmytips.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: screenHeight * 0.130,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(regularController.allmytips[index].vpnname
                              .toString()),
                          Text(regularController.allmytips[index].country
                              .toString()),
                          Text(regularController.allmytips[index].ipaddress
                              .toString()),
                          Text(regularController.allmytips[index].date
                              .toString()),
                          Text(regularController.allmytips[index].ipno
                              .toString()),
                        ],
                      ),
                    );
                  },
                );
              }
            })),
          ],
        ),
      ),
    ));
  }
}

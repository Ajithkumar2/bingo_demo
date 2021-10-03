// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:bingo_demo/const.dart';
import 'package:bingo_demo/models/all_orders.dart';
import 'package:bingo_demo/screens/checkout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrdersListPage> {
  TextEditingController searchTextController = TextEditingController();
  List<Item> dummyList = [];
  late OrderData orderData;
  var data1;
  ScrollController scrollController = ScrollController();
  bool load = true;
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/sample_data.json');
    final data = await json.decode(response);
    setState(() {
      orderData = OrderData.fromJson(data);
      load = false;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (context) => InkWell(
              child: Image.asset("assets/hamburgar.png"),
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Bingo Shop",
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.bold, color: appbarcolor),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              )),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontFamily: "WorkSansLight"),
                          filled: true,
                          hintText: 'Order id or Name'),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            color: appbarcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            load == true ? Container() : buildOrders()
          ],
        ),
      ),
    );
  }

  Widget buildOrders() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: blueBackground),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, bottom: 10),
            child: Text(orderData.overall.allOrders,
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  child: Text("All TImes -1543"),
                  style: ElevatedButton.styleFrom(
                      primary: appbarcolor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  child: Text(orderData.overall.date),
                  style: ElevatedButton.styleFrom(
                      primary: appbarcolor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(
                  Icons.date_range,
                  size: 40,
                  color: appbarcolor,
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: orderData.items.length,
                      itemBuilder: (context, index) {
                        Item item = orderData.items[index];
                        return InkWell(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutPage(item: item),
                              ),
                            ),
                          },
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 4, top: 9),
                                      width: 70,
                                      height: 70,
                                      child: Center(
                                        child: Image.network(
                                          item.imageUrl,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      //order number and timestamp
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Text(item.orderNo,
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text(
                                                item.timeStamp,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            TextButton.icon(
                                                style: TextButton.styleFrom(
                                                    primary: item.orderStatus ==
                                                            "Pending"
                                                        ? yellow
                                                        : item.orderStatus ==
                                                                "Shipped"
                                                            ? orangeBrown
                                                            : purple),
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.fiber_manual_record,
                                                  size: 15,
                                                ),
                                                label: Text(
                                                  item.orderStatus,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              item.amount,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14,
                                                  color: purple,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(
                                            item.paymentStatus,
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 5),
                                            width: 60,
                                            height: 30,
                                            child: TextButton(
                                              child: Text('Details'),
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.grey[200],
                                                primary: Colors.grey[850],
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () {
                                                print('Pressed');
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ])),
                        );
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

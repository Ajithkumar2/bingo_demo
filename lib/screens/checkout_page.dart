import 'package:bingo_demo/const.dart';
import 'package:bingo_demo/models/orders_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  final Order item;
  const CheckOutPage({key, required this.item}) : super(key: key);
  @override
  _checkoutState createState() {
    return _checkoutState();
  }
}

class _checkoutState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appbarcolor, statusBarIconBrightness: Brightness.dark));
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text("Order No - " + widget.item.orderNo.toString()),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        "https://cflare.shop.bigbazaar.com/cdn-cgi/image/width=450/media/product/66/01/1_3-wide_zoom.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      children: [
                        Text(widget.item.itemName,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("1 Unit",
                            style: GoogleFonts.roboto(
                                color: Colors.grey[400], fontSize: 12)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("2 X Rs 67",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Rs. " + widget.item.price,
                        style: GoogleFonts.roboto(
                            color: purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        "https://cflare.shop.bigbazaar.com/cdn-cgi/image/width=450/media/product/66/01/1_3-wide_zoom.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      children: [
                        Text(widget.item.itemName,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("1 Unit",
                            style: GoogleFonts.roboto(
                                color: Colors.grey[400], fontSize: 12)),
                        const SizedBox(
                          height: 6,
                        ),
                        Text("2 X Rs 67",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Rs. " + widget.item.price,
                        style: GoogleFonts.roboto(
                            color: purple,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                color: blueBackground,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Selected items",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs. 355",
                          style: GoogleFonts.roboto(
                              color: purple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Fee",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs. 80",
                          style: GoogleFonts.roboto(
                              color: purple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs. 435",
                          style: GoogleFonts.roboto(
                              color: purple,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                color: blueBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Details",
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Name:",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Text(
                          "Jerem paul",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Mobile No:",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          "+91 998789920",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Adress:",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 65,
                        ),
                        Text(
                          "South Delhi",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Payment:",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Text(
                          "Online Payment",
                          style: GoogleFonts.roboto(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 70,
                          child: TextButton(
                            child: Text(
                              'Received',
                              style: GoogleFonts.roboto(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: mintGreen.withOpacity(0.2),
                              primary: Colors.green,
                              side: const BorderSide(
                                  color: Colors.green, width: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Reject Order"),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: carrotOrange),
                          ),
                        ),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Accept Order"),
                            style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: appbarcolor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}

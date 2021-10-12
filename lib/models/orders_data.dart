// To parse this JSON data, do
//
//     final orderData = orderDataFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

class OrderData {
  OrderData({
    required this.orders,
  });

  List<Order> orders;

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );
}

class Order {
  Order({
    required this.orderNo,
    required this.itemName,
    required this.dateAdded,
    required this.shippingStatus,
    required this.paymentStatus,
    required this.price,
  });

  int orderNo;
  String itemName;
  String dateAdded;
  String shippingStatus;
  String paymentStatus;
  String price;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderNo: json["orderNo"] ?? null,
        itemName: json["item_name"] ?? null,
        dateAdded: json["date_added"] ?? null,
        shippingStatus: json["shipping_status"] ?? null,
        paymentStatus: json["payment_status"] ?? null,
        price: json["price"] ?? null,
      );
}

class OrderData {
  OrderData({
    required this.overall,
    required this.items,
  });

  Overall overall;
  List<Item> items;

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        overall: Overall.fromJson(json["overall"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "overall": overall.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item(
      {required this.orderNo,
      required this.imageUrl,
      required this.itemName,
      required this.amount,
      required this.paymentStatus,
      required this.orderStatus,
      required this.timeStamp,
      required this.totalCount});

  String orderNo;
  String imageUrl;
  String itemName;
  String amount;
  String paymentStatus;
  String orderStatus;
  String totalCount;
  String timeStamp;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      // ignore: unnecessary_null_in_if_null_operators
      orderNo: json["orderNo"] ?? null,
      amount: json["amount"],
      paymentStatus: json["payment_status"],
      orderStatus: json["order_status"],
      itemName: json["item_name"],
      timeStamp: json["timestamp"],
      totalCount: json["total_count"],
      imageUrl: json["item_url"]);

  Map<String, dynamic> toJson() => {
        "orderNo": orderNo,
        "amount": amount,
        "payment_status": paymentStatus,
        "order_status": orderStatus,
      };
}

class Overall {
  Overall({
    required this.allOrders,
    required this.allTimes,
    required this.date,
  });

  String allOrders;
  String allTimes;
  String date;

  factory Overall.fromJson(Map<String, dynamic> json) => Overall(
        allOrders: json["allOrders"],
        allTimes: json["allTimes"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "allOrders": allOrders,
        "allTimes": allTimes,
        "date": date,
      };
}

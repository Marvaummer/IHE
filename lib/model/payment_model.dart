import 'dart:convert';

// Helper function to handle conversion of dynamic values to int
int? parseToInt(dynamic value) {
  if (value is int) return value;
  if (value is double) return value.toInt();
  return null;
}

List<Paymentmodel> paymentmodelFromJson(String str) =>
    List<Paymentmodel>.from(json.decode(str).map((x) => Paymentmodel.fromJson(x)));

String paymentmodelToJson(List<Paymentmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Paymentmodel {
  String? id;
  int? pvid;
  int? vid;
  String? pvno;
  DateTime? pvdate;
  String? pvrefno;
  Narration? pvnarration;
  int? pvcomid;
  int? pvbranchid;
  int? pvcreatedby;
  int? pvupdatedby;
  DateTime? pvcreatedon;
  DateTime? pvupdatedon;
  int? pvnonum;
  int? pvformid;
  int? pvcashid;
  int? pvbankid;
  double? pvpaidamt;
  Pvmode? pvmode;
  Pvpaymode? pvpaymode;
  int? pvchequestatus;
  DateTime? pvrefdate;
  dynamic pvchqclrdate;
  int? daycloseid;
  List<Detail>? details;
  dynamic code;
  dynamic account;
  dynamic printFile;
  dynamic amountsInWords;

  Paymentmodel({
    this.id,
    this.pvid,
    this.vid,
    this.pvno,
    this.pvdate,
    this.pvrefno,
    this.pvnarration,
    this.pvcomid,
    this.pvbranchid,
    this.pvcreatedby,
    this.pvupdatedby,
    this.pvcreatedon,
    this.pvupdatedon,
    this.pvnonum,
    this.pvformid,
    this.pvcashid,
    this.pvbankid,
    this.pvpaidamt,
    this.pvmode,
    this.pvpaymode,
    this.pvchequestatus,
    this.pvrefdate,
    this.pvchqclrdate,
    this.daycloseid,
    this.details,
    this.code,
    this.account,
    this.printFile,
    this.amountsInWords,
  });

  factory Paymentmodel.fromJson(Map<String, dynamic> json) => Paymentmodel(
    id: json["\u0024id"],
    pvid: parseToInt(json["pvid"]),
    vid: parseToInt(json["vid"]),
    pvno: json["pvno"],
    pvdate: json["pvdate"] == null ? null : DateTime.parse(json["pvdate"]),
    pvrefno: json["pvrefno"],
    pvnarration: narrationValues.map[json["pvnarration"]]!,
    pvcomid: parseToInt(json["pvcomid"]),
    pvbranchid: parseToInt(json["pvbranchid"]),
    pvcreatedby: parseToInt(json["pvcreatedby"]),
    pvupdatedby: parseToInt(json["pvupdatedby"]),
    pvcreatedon:
    json["pvcreatedon"] == null ? null : DateTime.parse(json["pvcreatedon"]),
    pvupdatedon:
    json["pvupdatedon"] == null ? null : DateTime.parse(json["pvupdatedon"]),
    pvnonum: parseToInt(json["pvnonum"]),
    pvformid: parseToInt(json["pvformid"]),
    pvcashid: parseToInt(json["pvcashid"]),
    pvbankid: parseToInt(json["pvbankid"]),
    pvpaidamt: json["pvpaidamt"]?.toDouble(),
    pvmode: pvmodeValues.map[json["pvmode"]]!,
    pvpaymode: pvpaymodeValues.map[json["pvpaymode"]]!,
    pvchequestatus: parseToInt(json["pvchequestatus"]),
    pvrefdate:
    json["pvrefdate"] == null ? null : DateTime.parse(json["pvrefdate"]),
    pvchqclrdate: json["pvchqclrdate"],
    daycloseid: parseToInt(json["daycloseid"]),
    details: json["details"] == null
        ? []
        : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
    code: json["code"],
    account: json["account"],
    printFile: json["printFile"],
    amountsInWords: json["amountsInWords"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "pvid": pvid,
    "vid": vid,
    "pvno": pvno,
    "pvdate": pvdate?.toIso8601String(),
    "pvrefno": pvrefno,
    "pvnarration": narrationValues.reverse[pvnarration],
    "pvcomid": pvcomid,
    "pvbranchid": pvbranchid,
    "pvcreatedby": pvcreatedby,
    "pvupdatedby": pvupdatedby,
    "pvcreatedon": pvcreatedon?.toIso8601String(),
    "pvupdatedon": pvupdatedon?.toIso8601String(),
    "pvnonum": pvnonum,
    "pvformid": pvformid,
    "pvcashid": pvcashid,
    "pvbankid": pvbankid,
    "pvpaidamt": pvpaidamt,
    "pvmode": pvmodeValues.reverse[pvmode],
    "pvpaymode": pvpaymodeValues.reverse[pvpaymode],
    "pvchequestatus": pvchequestatus,
    "pvrefdate": pvrefdate?.toIso8601String(),
    "pvchqclrdate": pvchqclrdate,
    "daycloseid": daycloseid,
    "details": details == null
        ? []
        : List<dynamic>.from(details!.map((x) => x.toJson())),
    "code": code,
    "account": account,
    "printFile": printFile,
    "amountsInWords": amountsInWords,
  };
}

class Detail {
  String? id;
  int? dtpvid;
  int? dtvid;
  int? dtaccid;
  Narration? dtnarration;
  double? dtamount;
  String? code;
  String? account;
  dynamic billList;
  int? debit;

  Detail({
    this.id,
    this.dtpvid,
    this.dtvid,
    this.dtaccid,
    this.dtnarration,
    this.dtamount,
    this.code,
    this.account,
    this.billList,
    this.debit,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["\u0024id"],
    dtpvid: parseToInt(json["dtpvid"]),
    dtvid: parseToInt(json["dtvid"]),
    dtaccid: parseToInt(json["dtaccid"]),
    dtnarration: narrationValues.map[json["dtnarration"]]!,
    dtamount: json["dtamount"]?.toDouble(),
    code: json["code"],
    account: json["account"],
    billList: json["billList"],
    debit: parseToInt(json["debit"]),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "dtpvid": dtpvid,
    "dtvid": dtvid,
    "dtaccid": dtaccid,
    "dtnarration": narrationValues.reverse[dtnarration],
    "dtamount": dtamount,
    "code": code,
    "account": account,
    "billList": billList,
    "debit": debit,
  };
}

enum Narration {
  AF_PAID,
  AR_BANK,
  CASH,
  CASH_RESERVE,
  EMPTY,
  EXP_ACC,
  SIR_PAYABLE
}

final narrationValues = EnumValues({
  "AF PAID": Narration.AF_PAID,
  "AR BANK": Narration.AR_BANK,
  "CASH": Narration.CASH,
  "CASH RESERVE": Narration.CASH_RESERVE,
  "": Narration.EMPTY,
  "exp acc": Narration.EXP_ACC,
  "SIR PAYABLE": Narration.SIR_PAYABLE
});

enum Pvmode { BANK, CASH }

final pvmodeValues = EnumValues({
  "BANK": Pvmode.BANK,
  "CASH": Pvmode.CASH,
});

enum Pvpaymode { BANK_TRANSFER, CASH }

final pvpaymodeValues = EnumValues({
  "Bank Transfer": Pvpaymode.BANK_TRANSFER,
  "Cash": Pvpaymode.CASH,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

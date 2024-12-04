// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceModel {
  String? id;
  int? vehiclEId;
  int? owneRId;
  String? vehiclERegistrationNo;
  int? vehiclETypeId;
  String? make;
  String? model;
  int? yeaROfManufacture;
  String? color;
  String? enginENo;
  String? chassiSNo;
  String? insurancEPolicyNo;
  DateTime? insurancEExpiryDate;
  DateTime? registratioNExpiryDate;
  DateTime? purchasEDate;
  String? istimarANo;
  DateTime? istimarAExpiryDate;
  int? brancHId;
  int? createdby;
  int? updatedby;
  DateTime? createDAt;
  DateTime? updateDAt;
  String? ref;

  ServiceModel({
    this.id,
    this.vehiclEId,
    this.owneRId,
    this.vehiclERegistrationNo,
    this.vehiclETypeId,
    this.make,
    this.model,
    this.yeaROfManufacture,
    this.color,
    this.enginENo,
    this.chassiSNo,
    this.insurancEPolicyNo,
    this.insurancEExpiryDate,
    this.registratioNExpiryDate,
    this.purchasEDate,
    this.istimarANo,
    this.istimarAExpiryDate,
    this.brancHId,
    this.createdby,
    this.updatedby,
    this.createDAt,
    this.updateDAt,
    this.ref,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["\u0024id"],
    vehiclEId: json["vehiclE_ID"],
    owneRId: json["owneR_ID"],
    vehiclERegistrationNo: json["vehiclE_REGISTRATION_NO"],
    vehiclETypeId: json["vehiclE_TYPE_ID"],
    make: json["make"],
    model: json["model"],
    yeaROfManufacture: json["yeaR_OF_MANUFACTURE"],
    color: json["color"],
    enginENo: json["enginE_NO"],
    chassiSNo: json["chassiS_NO"],
    insurancEPolicyNo: json["insurancE_POLICY_NO"],
    insurancEExpiryDate: json["insurancE_EXPIRY_DATE"] == null ? null : DateTime.parse(json["insurancE_EXPIRY_DATE"]),
    registratioNExpiryDate: json["registratioN_EXPIRY_DATE"] == null ? null : DateTime.parse(json["registratioN_EXPIRY_DATE"]),
    purchasEDate: json["purchasE_DATE"] == null ? null : DateTime.parse(json["purchasE_DATE"]),
    istimarANo: json["istimarA_NO"],
    istimarAExpiryDate: json["istimarA_EXPIRY_DATE"] == null ? null : DateTime.parse(json["istimarA_EXPIRY_DATE"]),
    brancHId: json["brancH_ID"],
    createdby: json["createdby"],
    updatedby: json["updatedby"],
    createDAt: json["createD_AT"] == null ? null : DateTime.parse(json["createD_AT"]),
    updateDAt: json["updateD_AT"] == null ? null : DateTime.parse(json["updateD_AT"]),
    ref: json["\u0024ref"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "vehiclE_ID": vehiclEId,
    "owneR_ID": owneRId,
    "vehiclE_REGISTRATION_NO": vehiclERegistrationNo,
    "vehiclE_TYPE_ID": vehiclETypeId,
    "make": make,
    "model": model,
    "yeaR_OF_MANUFACTURE": yeaROfManufacture,
    "color": color,
    "enginE_NO": enginENo,
    "chassiS_NO": chassiSNo,
    "insurancE_POLICY_NO": insurancEPolicyNo,
    "insurancE_EXPIRY_DATE": insurancEExpiryDate?.toIso8601String(),
    "registratioN_EXPIRY_DATE": registratioNExpiryDate?.toIso8601String(),
    "purchasE_DATE": purchasEDate?.toIso8601String(),
    "istimarA_NO": istimarANo,
    "istimarA_EXPIRY_DATE": istimarAExpiryDate?.toIso8601String(),
    "brancH_ID": brancHId,
    "createdby": createdby,
    "updatedby": updatedby,
    "createD_AT": createDAt?.toIso8601String(),
    "updateD_AT": updateDAt?.toIso8601String(),
    "\u0024ref": ref,
  };
}

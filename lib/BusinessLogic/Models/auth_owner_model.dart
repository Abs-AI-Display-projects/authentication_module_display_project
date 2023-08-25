import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AuthUserModel {
  String uid;
  String storeName;
  String shopGPSLocation;
  String storeType;
  String storeSize;
  String storeOwnerName;
  String storeOwnerNumber;
  String deliveryManCount;
  bool legalStatement;
  String date;
  String promoCode;
  String storeRating;
  String subscriptionStatus;
  String userToken;

  static final AuthUserModel insteance = AuthUserModel(storeOwnerNumber: '');
  AuthUserModel({
    this.uid = '',
    this.storeName = '',
    this.shopGPSLocation = '',
    this.storeType = '',
    this.storeSize = '',
    this.storeOwnerName = '',
    required this.storeOwnerNumber,
    this.deliveryManCount = '',
    this.legalStatement = false,
    this.date = '',
    this.promoCode = '',
    this.storeRating = '',
    this.subscriptionStatus = 'SubscriptionState.FREE_TRIAL',
    this.userToken = '',
  });

  factory AuthUserModel.fromDocumentSnapshot(
      DocumentSnapshot documentSnapshot) {
    return AuthUserModel(
      storeName: documentSnapshot.get('shopName'),
      shopGPSLocation: documentSnapshot.get('shopGPSLocation'),
      storeType: documentSnapshot.get('shopType'),
      storeSize: documentSnapshot.get('shopSize'),
      storeOwnerName: documentSnapshot.get('ownerName'),
      storeOwnerNumber: documentSnapshot.get('ownerNumber'),
      deliveryManCount: documentSnapshot.get('deliveryManCount'),
      legalStatement: documentSnapshot.get('legalStatement'),
      date: documentSnapshot.get('date'),
      promoCode: documentSnapshot.get('promoCode'),
      storeRating: documentSnapshot.get('shopRating'),
      subscriptionStatus: documentSnapshot.get('subscriptionStatus'),
      userToken: documentSnapshot.get('userToken'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userToken': userToken,
      'ownerName': storeOwnerName,
      'date': date,
      'ownerNumber': storeOwnerNumber,
      'shopName': storeName,
      'shopType': storeType,
      'deliveryManCount': deliveryManCount.trim(),
      "shopGPSLocation": shopGPSLocation,
      'shopSize': storeSize,
      "shopRating": storeRating,
      "subscriptionStatus": subscriptionStatus,
      "promoCode": promoCode,
      "legalStatement": legalStatement,
    };
  }

  // TODO
  AuthUserModel copyWith({
    String? uid,
    String? storeName,
    String? shopGPSLocation,
    String? storeType,
    String? storeSize,
    String? storeOwnerName,
    String? storeOwnerNumber,
    String? deliveryManCount,
    bool? legalStatement,
    String? date,
    String? promoCode,
    String? storeRating,
    String? subscriptionStatus,
    String? userToken,
  }) {
    return AuthUserModel(
      uid: uid ?? this.uid,
      storeName: storeName ?? this.storeName,
      shopGPSLocation: shopGPSLocation ?? this.shopGPSLocation,
      storeType: storeType ?? this.storeType,
      storeSize: storeSize ?? this.storeType,
      storeOwnerName: storeOwnerName ?? this.storeOwnerName,
      storeOwnerNumber: storeOwnerNumber ?? this.storeOwnerNumber,
      deliveryManCount: deliveryManCount ?? this.deliveryManCount,
      legalStatement: legalStatement ?? this.legalStatement,
      date: date ?? this.date,
      promoCode: promoCode ?? this.promoCode,
      storeRating: storeRating ?? this.storeRating,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      userToken: userToken ?? this.userToken,
    );
  }
}

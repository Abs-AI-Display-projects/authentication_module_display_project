import '../../../components/dropDownBox.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

// - REGISTER LISTS

List<Item> shopTypeList = <Item>[
  const Item(
    "grocery",
    'محل بقالة',
    Icon(
      Icons.shopping_basket_outlined,
      color: purplePrimaryColor,
    ),
  ),
  const Item(
    "clothes",
      'محل ملابس',
      Icon(
        Icons.shopping_bag_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
      "makeup",
      'مكياج و ادوات تجميل',
      Icon(
        Icons.shopping_bag_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
    "stationary",
      'ادوات مكتبية',
      Icon(
        Icons.shopping_bag_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
    "cleaning",
      'محل منظفات',
      Icon(
        Icons.shopping_bag_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
      "roasters",
      "محل محمصات",
      Icon(
        Icons.shopping_bag_outlined,
        color: purplePrimaryColor,
      )),
  Item("other",
      'اخري'.trim(),
      const Icon(
        Icons.shopping_cart_sharp,
        color: purplePrimaryColor,
      )),
];

List<Item> shopSizeList = <Item>[
  const Item(
    "bigShop",
      'محل كبير',
      Icon(
        Icons.local_convenience_store_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
    "mediumShop",
      'محل متوسط',
      Icon(
        Icons.store_outlined,
        color: purplePrimaryColor,
      )),
  const Item(
    "smallShop",
      'محل صغير/ كشك',
      Icon(
        Icons.storefront_outlined,
        color: purplePrimaryColor,
      )),
];
List<Item> legalStatementSelectionList = <Item>[
  const Item("yes",'ايوا', Icon(Icons.fact_check_sharp)),
  const Item("no",'لا', Icon((Icons.fact_check_outlined))),
];

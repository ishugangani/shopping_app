import 'package:flutter/material.dart';
import 'package:shopping_app/screen/home/modal/home_modal.dart';

class HomeProvider extends ChangeNotifier
{
  List<DataModal> pList =[
    DataModal(image: "🍉",Pname: "WaterMelon",price: 130,qty: 1),
    DataModal(image: "🍈",Pname: "Melon",price: 150,qty: 1),
    DataModal(image: "🍑",Pname: "Peach",price: 120,qty: 1),
    DataModal(image: "🥝",Pname: "Kiwi",price: 90,qty: 1),
    DataModal(image: "🍓",Pname: "Strawberry",price: 100,qty: 1),
    DataModal(image: "🍎",Pname: "Apple",price: 50,qty: 1),
    DataModal(image: "🥭",Pname: "Mango",price: 200,qty: 1),
    DataModal(image: "🍍",Pname: "Pineapple",price: 500,qty: 1),
    DataModal(image: "🍇",Pname: "Grapes",price: 70,qty: 1),
    DataModal(image: "🍊",Pname: "Orange",price: 30,qty: 1),
  ];

  List<DataModal> cList =[];

  void addCart(DataModal d1)
  {
    cList.add(d1);
  }

  void updateCart(int index,DataModal d1)
  {
    cList[index]=d1;
    notifyListeners();
  }
}
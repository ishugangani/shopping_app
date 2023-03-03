import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screen/home/modal/home_modal.dart';
import 'package:shopping_app/screen/home/provider/home_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeProvider? hp;
  @override
  Widget build(BuildContext context) {

    hp = Provider.of<HomeProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff497174),
          title: Text("Cart"),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffEFF5F5),
        body: Consumer<HomeProvider>(
          builder: (context, value, child)
          {
            return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: Text(
                    "${hp!.cList[index].image}",
                    style: TextStyle(
                      color: Color(0xff497174),
                    ),
                  ),
                  title: Text(
                    "${hp!.cList[index].Pname}",
                    style: GoogleFonts.lora(
                      color: Color(0xffEB6440),
                    ),
                  ),
                  subtitle: Text(
                    "${hp!.cList[index].price}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          DataModal d1 = DataModal(
                            qty: hp!.pList[index].qty! + 1,
                            price: hp!.pList[index].price,
                            Pname: hp!.pList[index].Pname,
                            image: hp!.pList[index].image,
                          );
                          hp!.updateCart(index, d1);
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text("${hp!.cList[index].qty}"),
                      IconButton(
                          onPressed: () {
                            DataModal d1 = DataModal(
                              qty: hp!.pList[index].qty! - 1,
                              price: hp!.pList[index].price,
                              Pname: hp!.pList[index].Pname,
                              image: hp!.pList[index].image,
                            );
                            hp!.updateCart(index, d1);
                          },
                          icon: Icon(Icons.remove)),
                    ],
                  ),
                ),
                itemCount: hp!.cList.length,
              );
          },
        )
      ),
    );
  }
}

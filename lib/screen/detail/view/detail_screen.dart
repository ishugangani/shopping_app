import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screen/home/modal/home_modal.dart';
import 'package:shopping_app/screen/home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  HomeProvider? hp;

  @override
  Widget build(BuildContext context) {

    hp= Provider.of<HomeProvider>(context,listen: false);
    DataModal d1 = ModalRoute.of(context)!.settings.arguments as DataModal;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff497174),
          title: Text("${d1.Pname}"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cart');
              },
              icon: Icon(Icons.shopping_cart)),
          ],
        ),
        backgroundColor: Color(0xffEFF5F5),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text(
                  "${d1.image}",
                  style: TextStyle(fontSize: 100, color: Color(0xff497174)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${d1.Pname}",
                  style: GoogleFonts.lora(fontSize: 45,color: Color(0xffEB6440)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rs. ${d1.price}",
                  style: TextStyle(color: Colors.grey,fontSize: 25),
                ),
                SizedBox(height: 50,),
                ElevatedButton(
                  onPressed: () {
                    hp!.addCart(d1);
                  },
                  child: Text("Add to Cart"),style: ElevatedButton.styleFrom(backgroundColor: Color(0xff497174))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

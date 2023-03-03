import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screen/home/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? HP;

  @override
  Widget build(BuildContext context) {
    HP = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff497174),
          title: Text("Fruits"),
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
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: HP!.pList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail',arguments: HP!.pList[index]);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffD6E4E5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${HP!.pList[index].image}",
                      style: TextStyle(fontSize: 50, color: Color(0xff497174)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${HP!.pList[index].Pname}",
                      style: GoogleFonts.lora(fontSize: 28,color: Color(0xffEB6440)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rs. ${HP!.pList[index].price}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

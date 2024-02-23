import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/OnlineShoping/Provider/cart.dart';
import 'package:todo_app/OnlineShoping/Provider/model.dart';
import 'package:todo_app/OnlineShoping/Screens/cartpage.dart';
import 'package:todo_app/OnlineShoping/Widgets/styledCard.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    final List<Item> stock = context.watch<Stock>().stock;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Shopping'),
        centerTitle: true,
        actions: [
          Stack(children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
              },
              child: const Icon(
                Icons.shopping_cart,
                size: 40,
              ),
            ),
            Positioned(
                right: 13,
                top: 5,
                child: Text(
                  '${context.watch<Cart>().cart.length}',
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ))
          ]),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text('Items'),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: context.watch<Stock>().stock.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    StyledCard(
                      item: stock[index],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

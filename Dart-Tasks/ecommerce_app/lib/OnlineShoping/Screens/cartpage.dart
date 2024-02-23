import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/OnlineShoping/Provider/cart.dart';
import 'package:todo_app/OnlineShoping/Provider/model.dart';
import 'package:todo_app/OnlineShoping/Widgets/styledCard.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final List<Item> items = context.watch<Cart>().cart;
    double total = 0;
    double totalCost() {
      for (Item item in items) {
        total += item.price;
      }
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const Text('Cart'),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemCount: context.watch<Cart>().cart.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          StyledCard(
                            item: items[index],
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Text(
                  'Total: \$${totalCost()}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

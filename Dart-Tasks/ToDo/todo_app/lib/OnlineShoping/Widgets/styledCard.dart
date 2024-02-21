import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/OnlineShoping/Provider/cart.dart';
import 'package:todo_app/OnlineShoping/Provider/model.dart';
import 'package:todo_app/OnlineShoping/Widgets/styledButton.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({super.key, required this.item});
  final Item item;

  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage(widget.item.imagePath),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.name),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.item.price.toString())
                ],
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 20,
            child: GestureDetector(
                onTap: () {
                  if (widget.item.isAdded) {
                    context.read<Stock>().unmark(widget.item);
                    context.read<Cart>().removeCart(widget.item);
                  } else {
                    context.read<Stock>().mark(widget.item);
                    context.read<Cart>().addCart(widget.item);
                  }
                },
                child: widget.item.isAdded
                    ? const Icon(
                        Icons.highlight_remove_sharp,
                        color: Colors.red,
                        size: 30,
                      )
                    : styledButton('Add', 60, Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }
}

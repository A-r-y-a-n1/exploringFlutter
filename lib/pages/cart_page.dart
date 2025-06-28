import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: "Cart".text.color(context.theme.hintColor).make()),
      body: Column(
        children: [_CartList().p32().expand(), const Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(
          mutations: const {RemoveMutation},
          builder: (BuildContext context, store, VxStatus? status) {
            return "\$${cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.hintColor)
                .make();
          },
        ),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          "Buying not supported yet".text.xl.center.make()));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.buttonColor)),
                child: "Buy".text.white.make())
            .w32(context)
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.items.isEmpty
        ? "Your cart is empty".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline_outlined),
                onPressed: () => RemoveMutation(cart.items[index]),
              ),
              title: Text(cart.items[index].name.toString()),
            ),
          );
  }
}

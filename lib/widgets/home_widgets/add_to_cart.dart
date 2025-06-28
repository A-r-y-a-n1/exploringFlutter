import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    bool IsInCart = cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!IsInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.buttonColor,
          ),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          )),
      child: IsInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

import 'package:bit_coin_ticket/core/features/controller/riverpod_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class Monero extends ConsumerWidget {
  const Monero({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monero = ref.watch(moneroProvider);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Crypto"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_sharp))
          ],
        ),
        body: monero.when(
          error: (error, stackTrace) => Center(
            child: Text("$error$stackTrace"),
          ),
          loading: () => Center(
            child: Lottie.asset('assets/reload.json'),
          ),
          data: (data) {
            final currency = data.keys.first;
            final price = data[currency];
            return Column(
              children: [
                LottieBuilder.asset(
                  'assets/binancr.json',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_sharp)),
                    IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.arrow_forward_ios_sharp))
                  ],
                ),
                Text(
                  currency.toString().toUpperCase(),
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  " ${price!.toStringAsFixed(2)}  \$ USD",
                  style: const TextStyle(fontSize: 20),
                ),
                 const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_rounded),
                        label: const Text('Buy Now')),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.currency_exchange),
                        label: const Text('Exchange'))
                  ],
                )
              ],
            );
          },
        ));
  }
}
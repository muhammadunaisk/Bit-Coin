import 'package:bit_coin_ticket/core/features/controller/riverpod_controller.dart';
import 'package:bit_coin_ticket/core/features/view/etherum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoPrice = ref.watch(bitCoinProvider);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text("Crypto"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_sharp))
          ],
        ),
       
        body: cryptoPrice.when(
          error: (error, stackTrace) => Center(
            child: Text("$error$stackTrace"),
          ),
          loading: () => Center(
            child: Lottie.asset('assets/trip.json'),
          ),
          data: (data) {
            final currency = data.keys.first;
            final price = data[currency];
            return Column(
              children: [
                LottieBuilder.asset(
                  'assets/bitcoin.json',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios_sharp)),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Etherum(),
                              ));
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
                  height: 50,
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
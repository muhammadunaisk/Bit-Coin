import 'dart:convert';

import 'package:bit_coin_ticket/core/services/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'riverpod_controller.g.dart';
final bitCoinProvider = StreamProvider<Map<String, double>>((ref) {
  final webSocket = ref.watch(webSocketProvider);

  return webSocket.stream.map((event) {
    final Map<String, dynamic> data = json.decode(event);
    return data
        .map((key, value) => MapEntry(key, double.parse(value.toString())));
  });
});

final etherumProvider = StreamProvider<Map<String, double>>((ref) {
  final webSocket = ref.watch(webSocketProvider1);

  return webSocket.stream.map((event) {
    final Map<String, dynamic> data = json.decode(event);
    return data
        .map((key, value) => MapEntry(key, double.parse(value.toString())));
  });
});
final moneroProvider = StreamProvider<Map<String, double>>((ref) {
  final webSocket = ref.watch(webSocketProvider2);

  return webSocket.stream.map((event) {
    final Map<String, dynamic> data = json.decode(event);
    return data
        .map((key, value) => MapEntry(key, double.parse(value.toString())));
  });
});
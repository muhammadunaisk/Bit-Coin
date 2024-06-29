import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

 final webSocketProvider = Provider<WebSocketChannel>((ref) {
  final webSocket =
      IOWebSocketChannel.connect('wss://ws.coincap.io/prices?assets=bitcoin');
  return webSocket;
});
final webSocketProvider1 = Provider<WebSocketChannel>((ref) {
  final webSocket =
      IOWebSocketChannel.connect('wss://ws.coincap.io/prices?assets=ethereum');
  return webSocket;
});
final webSocketProvider2 = Provider<WebSocketChannel>((ref) {
  final webSocket =
      IOWebSocketChannel.connect('wss://ws.coincap.io/prices?assets=monero');
  return webSocket;
});
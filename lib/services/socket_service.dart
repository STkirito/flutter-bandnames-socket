import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    _socket = IO.io(
        'http://192.168.1.20:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .enableAutoConnect() // optional
            .build());

    _socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    _socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}

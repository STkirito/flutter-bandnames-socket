import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    //tarea: socketService.socket.emit(event);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ServerStatus: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          //tarea
          //emitir:
          //{nombre: 'FLutter', mensaje: 'Hola Mundo FLutter'}
          socketService.socket.emit('emitir-mensaje',
              {'nombre': 'FLutter', 'mensaje': 'Hola Mundo FLutter'});
        },
      ),
    );
  }
}

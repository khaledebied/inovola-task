import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIOHelper {
  late IO.Socket socket;

  final String serverUrl;
  final Map<String, dynamic>? options;

  Function(String event, dynamic data)? onEventReceived;
  Function()? onReconnected;

  SocketIOHelper({
    required this.serverUrl,
    this.options,
    this.onEventReceived,
    this.onReconnected,
  });

  Future<void> init() async {
    try {
      // Create socket with default options if none provided
      final socketOptions = options ??
          {
            'transports': ['websocket'],
            'autoConnect': false,
            'reconnection': true,
            'reconnectionAttempts': 5,
            'reconnectionDelay': 1000,
          };

      socket = IO.io(serverUrl, socketOptions);

      // Setup listeners
      socket.onConnect((_) {
        log('Socket.IO Connected');
      });

      socket.onDisconnect((_) {
        log('Socket.IO Disconnected');
      });

      socket.onReconnect((_) {
        log('Socket.IO Reconnected');
        if (onReconnected != null) {
          onReconnected!();
        }
      });

      socket.onConnectError((error) {
        log('Socket.IO Connection Error: $error');
      });

      socket.onError((error) {
        log('Socket.IO Error: $error');
      });

      // Connect to socket server
      await connect();
    } catch (e) {
      log('Socket.IO Init Error: $e');
      await disconnect();
      await reconnect();
    }
  }

  Future<void> connect() async {
    if (!socket.connected) {
      socket.connect();
      log('Socket.IO Connect called');
    }
  }

  Future<void> disconnect() async {
    if (socket.connected) {
      socket.disconnect();
      log('Socket.IO Disconnected');
    }
  }

  Future<void> reconnect() async {
    await disconnect();
    await connect();
    log('Socket.IO Reconnected');
  }

  void on(String event, Function(dynamic) callback) {
    socket.on(event, (data) {
      log('Received Event: $event');
      log('Event Data: $data');

      if (onEventReceived != null) {
        onEventReceived!(event, data);
      }

      callback(data);
    });
  }

  void emit(String event, dynamic data) {
    if (socket.connected) {
      socket.emit(event, data);
      log('Emitted Event: $event | Data: $data');
    } else {
      log('Socket not connected. Cannot emit event: $event');
      connect();
    }
  }

  void off(String event) {
    socket.off(event);
    log('Unsubscribed from event: $event');
  }

  void offAll() {
    socket.clearListeners();
    log('Cleared all event listeners');
  }

  bool isConnected() {
    return socket.connected;
  }

  String getSocketId() {
    return socket.id ?? '';
  }
}

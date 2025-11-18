import 'dart:developer';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherHelper {
  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  final String apiKey;
  final String cluster;
  final String? channelName;

  Function(PusherEvent)? onEventReceived;
  Function()? onReconnected;

  PusherHelper({
    required this.apiKey,
    required this.cluster,
    this.channelName,
    this.onEventReceived,
    this.onReconnected,
  });

  Future<void> init() async {
    try {
      await pusher.init(
        apiKey: apiKey,
        cluster: cluster,
        onConnectionStateChange: _onConnectionStateChange,
        onError: _onPusherError,
        onSubscriptionSucceeded: _onSubscriptionSucceeded,
        onEvent: (event) {
          log("Received Event: ${event.eventName}");
          log("Event Data: ${event.data}");
          if (onEventReceived != null) {
            onEventReceived!(event);
          }
        },
        onSubscriptionError: _onSubscriptionError,
        onDecryptionFailure: _onDecryptionFailure,
        onMemberAdded: _onMemberAdded,
        onMemberRemoved: _onMemberRemoved,
      );
      connect();
    } catch (e) {
      log("Pusher Init Error: $e");
      await disconnect();
      await reconnect();
    }
  }

  Future<void> connect() async {
    await pusher.subscribe(channelName: channelName ?? '');
    await pusher.connect();
    log("Pusher Connected");
  }

  Future<void> disconnect() async {
    await pusher.unsubscribe(channelName: channelName ?? '');
    await pusher.disconnect();
    log("Pusher Disconnected");
  }

  Future<void> reconnect() async {
    await connect();
    if (onReconnected != null) {
      onReconnected!();
    }
    log("Pusher Reconnected");
  }

  void _onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Pusher Connection State Changed: $currentState");
  }

  void _onPusherError(String message, int? code, dynamic e) {
    log("Pusher Error: $message | Code: $code | Exception: $e");
  }

  void _onSubscriptionSucceeded(String channelName, dynamic data) {
    log("Subscription Succeeded: $channelName | Data: $data");
  }

  void _onSubscriptionError(String message, dynamic e) {
    log("Subscription Error: $message | Exception: $e");
  }

  void _onDecryptionFailure(String event, String reason) {
    log("Decryption Failure: $event | Reason: $reason");
  }

  void _onMemberAdded(String channelName, PusherMember member) {
    log("Member Added: $channelName | User: ${member.userId}");
  }

  void _onMemberRemoved(String channelName, PusherMember member) {
    log("Member Removed: $channelName | User: ${member.userId}");
  }
}

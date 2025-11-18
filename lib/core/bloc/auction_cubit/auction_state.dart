part of 'auction_cubit.dart';

@immutable
abstract class AuctionState {
  final Map<String, dynamic>? model;

  const AuctionState(this.model);
}

class AuctionInitial extends AuctionState {
  const AuctionInitial() : super(null);
}

class AuctionUpdateState extends AuctionState {
  const AuctionUpdateState(super.model);
}

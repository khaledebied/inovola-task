import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auction_state.dart';

class AuctionCubit extends Cubit<AuctionState> {
  AuctionCubit() : super(const AuctionInitial());

  void updateAuctionData(Map<String, dynamic>? model) {
    emit(AuctionUpdateState(model));
  }
}

import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/response/auth/withdraw/withdraw_response.dart';
import '../../repositery/withdraw_repositry.dart';

part 'withdraw_state.freezed.dart';

@freezed
abstract class WithdrawState with _$WithdrawState {
  const factory WithdrawState({required ApiResponse<WithDrawResponse> response}) = _WithdrawState;
}

class WithdrawStateNotifier extends StateNotifier<WithdrawState> {
  final WithdrawRepository withdrawRepository;

  WithdrawStateNotifier({required this.withdrawRepository}) : super(WithdrawState(response: ApiResponse.idle())) {
    // Replace 'yourVIDValue' with the actual VID value you want to fetch.
    getWithdrawtDetails();
  }

  Future<void> getWithdrawtDetails() async {
    try {
      state = state.copyWith(response: ApiResponse.loading());
      WithDrawResponse response = await withdrawRepository.getWithdrawtDetails("");

      var isSuccessFull = response.status == "Success";
      if (isSuccessFull) {
        state = state.copyWith(response: ApiResponse.completed(response));
      } else {
        state = state.copyWith(response: ApiResponse.error(response.message));
      }
    } on NetworkException catch (e) {
      state = state.copyWith(
        response: ApiResponse.error(e.message.toString()),
      );
    } on Exception catch (e) {
      state = state.copyWith(
        response: ApiResponse.error(e.toString()),
      );
    }
  }
}

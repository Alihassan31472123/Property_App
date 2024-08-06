import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/response/auth/withdraw/withdraw_response.dart';
import '../../models/response/userprofile/Getsaleresponse.dart';
import '../../repositery/sale_repo.dart';

part 'sale_state.freezed.dart';

@freezed
abstract class SaleState with _$SaleState {
  const factory SaleState({required ApiResponse<GetSaleResponse> response}) = _SaleState;
}

class SaleStateNotifier extends StateNotifier<SaleState> {
  final SaleRepository saleRepository;

  SaleStateNotifier({required this.saleRepository}) : super(SaleState(response: ApiResponse.idle())) {
    // Replace 'yourVIDValue' with the actual VID value you want to fetch.
    getsale();
  }

  Future<void> getsale() async {
    try {
      state = state.copyWith(response: ApiResponse.loading());
      GetSaleResponse response = await saleRepository.getsale();

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

import 'package:apni_property_app/features/core/models/response/product/products_list_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:apni_property_app/features/core/repositery/home_repository.dart';
import 'package:apni_property_app/networking/api_response/api_response.dart';
import 'package:apni_property_app/networking/network_exceptions.dart';

part 'home_state.freezed.dart';

@Freezed()
class HomeState with _$HomeState {
  const factory HomeState({required ApiResponse response}) = _HomeState;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  final HomeRepository homeRepository;

  HomeStateNotifier({required this.homeRepository})
      : super(HomeState(response: ApiResponse.idle())) {
    getClientFile();
  }

  Future<void> getClientFile() async {
    try {
      state = state.copyWith(response: ApiResponse.loading());
      ProductListResponse response = await homeRepository.getProductList();
      var isSuccessFull = response.status == "Success";
      if(isSuccessFull){
        state = state.copyWith(response: ApiResponse.completed(response));
      }else{
        state = state.copyWith(response: ApiResponse.error(response.message));

      }

    } on NetworkException catch (e) {
      state = state.copyWith(
        response: ApiResponse.error(e.message.toString()),
      );
    } on Exception catch (e) {
      {
        state = state.copyWith(
          response: ApiResponse.error(e.toString()),
        );
      }
    }
  }
}

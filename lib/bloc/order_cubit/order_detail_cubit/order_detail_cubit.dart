import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/api_response/captain_order_status_api_response.dart';
import '../../../resources/repository.dart';

part 'order_detail_state.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  OrderDetailCubit() : super(OrderDetailInitial());


  final repository = Repository();

  Future<void> orderStatusChange({required String orderId}) async {
    emit(LoadingState());
    final CaptainOrderStatusApiResponse apiResponse = await repository.orderStatusChangeRequest(orderId: orderId);
    if (apiResponse.result == true) {
      emit(OrderStatusChangeSuccessfully(apiResponse.message?? "Order Status Change Successfully"));
    } else {
      emit(FailedToOrderChangeStatus(apiResponse.message ?? "Failed To Change Order Status!"));
    }
  }


}

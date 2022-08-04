part of 'order_detail_cubit.dart';

abstract class OrderDetailState extends Equatable {
  const OrderDetailState();

  @override
  List<Object> get props => [];
}

class OrderDetailInitial extends OrderDetailState {}

class LoadingState extends OrderDetailState {}

class OrderStatusChangeSuccessfully extends OrderDetailState {
  final String message;

  const OrderStatusChangeSuccessfully(this.message);
}

class FailedToOrderChangeStatus extends OrderDetailState {
  final String message;

  const FailedToOrderChangeStatus(this.message);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sim_phone_captain/models/api_response/customer_orders_api_response.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';

import '../../../../bloc/order_cubit/order_detail_cubit/order_detail_cubit.dart';
import '../../../../bloc/order_cubit/orders_cubit.dart' hide LoadingState;
import '../../../../ui_components/show_snack_bar.dart';
import '../../../../utils/navigation_controller/navigator_screen.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen(this.order, {Key? key}) : super(key: key);
  final Orders order;

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  TextEditingController dateInput = TextEditingController();
  String? _dropDownValue;
  String? captainId;

  Future<void> _orderChangeButtonPressed({required BuildContext context, required String id}) async {
    context.read<OrderDetailCubit>().orderStatusChange(orderId: widget.order.id!);
  }

  Future<void> backScreen(BuildContext context) async {
    context.read<OrdersCubit>().allOrders();
    Nav.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OrderDetailCubit(),
      child: BlocConsumer<OrderDetailCubit, OrderDetailState>(
        listener: (context, state) {
          if (state is FailedToOrderChangeStatus) {
            showSnackBar(context, state.message);
          }
          if (state is OrderStatusChangeSuccessfully) {
            showSnackBar(context, state.message, type: SnackBarType.success);
            backScreen(context);
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
                child: Scaffold(
              appBar: AppBar(
                title: const Text("Order Detail"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Order No', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.id ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (widget.order.product?.type == "sim")
                            ? const Text('Number', style: TextStyle(fontWeight: FontWeight.bold))
                            : const Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.product?.nameOrNum ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "${widget.order.totalBill}",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Captain Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.franchise?.name ?? "",
                          style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            MapsLauncher.launchQuery(widget.order.deliveryAddress!);
                          },
                          child: SizedBox(
                            width: size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.location_on),
                                Expanded(
                                  child: Text(
                                    widget.order.deliveryAddress ?? "",
                                    maxLines: 5,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Delivered Date", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text(widget.order.date ?? "", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Status",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.order.status ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    (widget.order.status == "approved")
                        ? SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
                              ),
                              onPressed: () {
                                _orderChangeButtonPressed(context: context, id: widget.order.id!);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(size.height * 0.012),
                                child: Text(
                                  "Delivered",
                                  style: TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}

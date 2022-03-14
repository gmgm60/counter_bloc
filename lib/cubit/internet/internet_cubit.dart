import 'package:bloc/bloc.dart';
import 'package:bloc_counter/cubit/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(const InternetState(connectionType: ConnectionType.loading));


  // var connectivityResult = await (Connectivity().checkConnectivity());
  // if (connectivityResult == ConnectivityResult.mobile) {
  // // I am connected to a mobile network.
  // } else if (connectivityResult == ConnectivityResult.wifi) {
  // // I am connected to a wifi network.
  // }


}

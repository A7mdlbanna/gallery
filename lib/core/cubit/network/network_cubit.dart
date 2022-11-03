import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

import '../../network/network_connection.dart';

part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkInitial());

  ConnectivityResult? localSource;
  MyConnectivity connectivity = MyConnectivity.instance;
  void init(){
    connectivity.initialise();
    connectivity.myStream.listen((src) async{
      localSource = src.keys.toList()[0];
       source = localSource;
       if(localSource != ConnectivityResult.none) {
         print('online');
       }
       emit(Init());
    });
  }
}

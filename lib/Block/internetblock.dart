import 'dart:async';

import 'package:blockarchitecture/Block/interneteventblock.dart';
import 'package:blockarchitecture/Block/internetstateblock.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, Internetstate> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(Initialstate()) {
    // on will check which event comes or which not//
    on<InternetlostEvent>((event, emit) => emit(Internetloststate()));
    on<InternetBackEvent>((event, emit) => emit(InternetBackstate()));

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetBackEvent());
      } else {
        InternetlostEvent();
      }
    });
  }
  // this ovverride close the block and also close the connectcibity subscription
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}

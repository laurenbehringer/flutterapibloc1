import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapibloc1/presentation/utils/device_checker.dart';

part 'deviceinfo_event.dart';
part 'deviceinfo_state.dart';

class DeviceinfoBloc extends Bloc<DeviceinfoEvent, DeviceinfoState> {

  final DeviceChecker deviceChecker;

  DeviceinfoBloc({required this.deviceChecker}) : super(DeviceinfoInitial()) {
    on<DeviceinfoEvent>((event, emit) async {
      if (event is LoadingDeviceEvent){
        emit(DeviceInfoLoading());
        final deviceinfo = await deviceChecker.initPlatformState();
        final rootstatus = await deviceChecker.rootCheck();
        final androidVersion = await deviceChecker.androidVersion();
        print("here broski");
        print(deviceinfo);
        emit(AndroidDeviceInfoState(androiddeviceInfo: deviceinfo, rootStatus: rootstatus, androidVersion: androidVersion));
      }


    });
  }
}

part of 'deviceinfo_bloc.dart';

abstract class DeviceinfoState extends Equatable {
  const DeviceinfoState();
}

class DeviceinfoInitial extends DeviceinfoState {

  @override
  List<Object> get props => [];
}

class AndroidDeviceInfoState extends DeviceinfoState {
  final Map<String, dynamic> androiddeviceInfo;
  final String rootStatus;
  final String androidVersion;
  final String hello;

  AndroidDeviceInfoState({
    this.hello = '',
    required this.androiddeviceInfo,
    required this.rootStatus,
    required this.androidVersion,
  });

  @override
  List<Object> get props => [androiddeviceInfo, rootStatus, androidVersion];
}


class DeviceInfoLoading extends DeviceinfoState {
  @override
  List<Object> get props => [];
}

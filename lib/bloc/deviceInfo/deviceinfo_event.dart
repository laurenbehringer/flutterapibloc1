part of 'deviceinfo_bloc.dart';

abstract class DeviceinfoEvent extends Equatable {
  const DeviceinfoEvent();
}

class LoadingDeviceEvent extends DeviceinfoEvent{
  @override
  List<Object?> get props => [];
}

class LoadDeviceInfoEvent extends DeviceinfoEvent{
  @override
  List<Object?> get props => [];
}

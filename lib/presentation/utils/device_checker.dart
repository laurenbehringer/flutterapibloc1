import 'package:root/root.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:sim_data/sim_data.dart';
import 'package:sim_data/sim_model.dart';


class DeviceChecker{
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Future<Map<String, dynamic>> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    deviceData = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
    return deviceData;

  }


   Future <String> rootCheck() async {
    try{
      bool? result = await Root.isRooted();
      return result.toString();
    }
    catch(e){
      throw(e);
    }
  }


   Future<String> androidVersion() async {
     try{
       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
       return androidInfo.version.release.toString();
     }
     catch (e){
       throw e;
     }
   }

   Future<String> SimInfo() async {
     try{
       SimData simData = await SimDataPlugin.getSimData();
       String simserial = "";
       for (var s in simData.cards) {
         print('Serial number: ${s.serialNumber}');
       }
       return simserial;
     }
     catch (e){
       throw e;
     }
   }

}
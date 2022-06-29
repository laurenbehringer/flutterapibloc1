import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = new FlutterSecureStorage();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  void addNewItem(key, value) async {
    await storage.write(
        key: key,
        value: value,
        //aOptions: _getAndroidOptions()
    );
  }

  void readAll() async {
    String? value = await storage.read(key: "cifNum");
    print("read cifNum");
    print(value);
  }

}
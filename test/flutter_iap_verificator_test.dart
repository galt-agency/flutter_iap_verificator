import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_iap_verificator/flutter_iap_verificator.dart';
import 'package:flutter_iap_verificator/flutter_iap_verificator_platform_interface.dart';
import 'package:flutter_iap_verificator/flutter_iap_verificator_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterIapVerificatorPlatform
    with MockPlatformInterfaceMixin
    implements FlutterIapVerificatorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterIapVerificatorPlatform initialPlatform = FlutterIapVerificatorPlatform.instance;

  test('$MethodChannelFlutterIapVerificator is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterIapVerificator>());
  });

  test('getPlatformVersion', () async {
    FlutterIapVerificator flutterIapVerificatorPlugin = FlutterIapVerificator();
    MockFlutterIapVerificatorPlatform fakePlatform = MockFlutterIapVerificatorPlatform();
    FlutterIapVerificatorPlatform.instance = fakePlatform;

    expect(await flutterIapVerificatorPlugin.getPlatformVersion(), '42');
  });
}

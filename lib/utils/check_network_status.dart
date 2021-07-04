import 'dart:io';

class CheckNetWorkStatus{
  Future <String> testNetworkStatus()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return 'connected';
      }
    } on SocketException catch (_) {
      return 'not connected';
    }
  }
}
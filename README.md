# Flutter
an example application created to test Flutter possibilities with ASP.Net Core 2 Web API
1. https://flutter.io/setup-windows/
2. https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code
3. type 'flutter run' to run the application
4. IMPORTANT! To run API you have to follow along:
  * Run your VS as Administrator
  * Ensure that you expose the API in applicationhost.config (a file lives in .vs in root of your application, look for bindings section with port 57971)
  * Run API and check whether the emulated browser can access any endpoint
  * Adding an appropriate rule in Firewall may be necessary
  * Disable proxy settings in Android Studio and on emulated device if necessary

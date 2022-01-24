import UIKit
import Flutter
import GoogleMaps
import flutter_config

var myKey = FlutterConfigPlugin.env(for: "GOOGLE_API_KEY")

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // GMSServices.provideAPIKey("GOOGLE_API_KEY")
    GMSServices.provideAPIKey(myKey)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

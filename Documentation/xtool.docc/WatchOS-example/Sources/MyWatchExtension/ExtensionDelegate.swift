import WatchKit
import SwiftUI

class ExtensionDelegate: NSObject, WKExtensionDelegate {
    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }
    
    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive.
    }
    
    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state.
    }
}


import UIKit
import Firebase
import FirebaseDatabase
import AVFoundation
import Fabric
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        Fabric.with([Twitter.self])
        let ud = UserDefaults.standard
        let isTutorial = ud.bool(forKey: CommonConst.IsTutorial )
       
        
        if isTutorial == false {
            let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "Tyu")
            self.window?.rootViewController = viewController
            self.window?.makeKey()
            
            return true
        }
        
        
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    let ApplicationDidEnterBackgroundNotification = "ApplicationDidEnterBackgroundNotification"
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        let ns = NotificationCenter.default
        ns.post(name: Notification.Name(rawValue: ApplicationDidEnterBackgroundNotification), object: nil)
    }
    
    
    
    
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    

}


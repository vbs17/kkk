

import UIKit
import Firebase
import FirebaseDatabase
import AVFoundation
import Fabric
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let uid = FIRAuth.auth()?.currentUser?.uid
    var window: UIWindow?

    func login(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: TabViewController = storyboard.instantiateViewController(withIdentifier: "Tab") as! TabViewController
        UIView.transition(with: self.window!, duration: 0.5, options: [.transitionFlipFromBottom, .showHideTransitionViews], animations: {() -> Void in
            self.window!.rootViewController = viewController
        }, completion: { _ in })
        
     }

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        Fabric.with([Twitter.self])
        let ProfileRef = FIRDatabase.database().reference(withPath: CommonConst.Profile).child(uid!)
        ProfileRef.keepSynced(true)
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


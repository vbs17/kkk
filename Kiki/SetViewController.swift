

import UIKit
import ESTabBarController
import Firebase
import FirebaseAuth
import SVProgressHUD

class SetViewController: UIViewController {
    
    
    
    @IBAction func back(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func out(sender: AnyObject) {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setBool(false, forKey: CommonConst.IsSavePlofileData)
        ud.synchronize()
        try! FIRAuth.auth()?.signOut()
        let loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(loginViewController!, animated: true, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

   }

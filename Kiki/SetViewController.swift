

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

class SetViewController: UIViewController {
    
    
    @IBAction func how(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "oth")
        self.navigationController?.pushViewController(basyoviewcontroller!, animated: true)
        
    }
    
    @IBAction func back(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func out(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        ud.set(false, forKey: CommonConst.IsSavePlofileData)
        ud.synchronize()
        try! FIRAuth.auth()?.signOut()
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
        self.present(loginViewController!, animated: true, completion: nil)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

   }

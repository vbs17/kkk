
import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD



class LoginViewController: UIViewController{
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var displayNameTextField: UITextField!
    var timer: Timer!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                let authToken = session.authToken
                let authTokenSecret = session.authTokenSecret
                // ...
            } else {
                // ...
            }
        })
        
        let credential = FIRTwitterAuthProvider.credentialWithToken(session.authToken, secret: session.authTokenSecret)
        
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            // ...
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    @IBAction func handleLoginButton(_ sender: AnyObject) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text {
            
            if address.characters.isEmpty || password.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
                self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(LoginViewController.kesu), userInfo: nil, repeats: false )

                return
            }
            
            SVProgressHUD.show()
            
            FIRAuth.auth()?.signIn(withEmail: address, password: password) { user, error in
                if error != nil {
                    SVProgressHUD.showError(withStatus: "エラー")
                    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LoginViewController.kesu), userInfo: nil, repeats: false )

                    
                } else {
                    if let displayName = user?.displayName {
                        self.setDisplayName(displayName)
                    }
                    
                    SVProgressHUD.dismiss()
                    
                    let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tab")
                    self.present(loginViewController!, animated: true, completion: nil)                }
            }
        }
    }
    
    @IBAction func handleCreateAcountButton(_ sender: AnyObject) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text,
            let displayName = displayNameTextField.text {
            if address.characters.isEmpty || password.characters.isEmpty
                || displayName.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
                self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(LoginViewController.kesu), userInfo: nil, repeats: false )

                return
            }
            
            SVProgressHUD.show()
            
            FIRAuth.auth()?.createUser(withEmail: address, password: password) { user, error in
                if error != nil {
                    SVProgressHUD.showError(withStatus: "エラー")
                     self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LoginViewController.kesu), userInfo: nil, repeats: false )
                } else {
                    FIRAuth.auth()?.signIn(withEmail: address, password: password) { user, error in
                        if error != nil {
                            SVProgressHUD.showError(withStatus: "エラー")
                            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(LoginViewController.kesu), userInfo: nil, repeats: false )

                        } else {
                            if let user = user {
                                let request = user.profileChangeRequest()
                                request.displayName = displayName
                                request.commitChanges() { error in
                                    if error != nil {
                                    } else {
                                        self.setDisplayName(displayName)
                                        
                                        SVProgressHUD.dismiss()
                                        
                                        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tab")
                                        self.present(loginViewController!, animated: true, completion: nil)                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func setDisplayName(_ name: String) {
        let ud = UserDefaults.standard
        ud.setValue(name, forKey: CommonConst.DisplayNameKey)
        ud.synchronize()
    }
    
    func kesu(){
        SVProgressHUD.dismiss()
        timer.invalidate()
    }
   
    
    
    
   
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

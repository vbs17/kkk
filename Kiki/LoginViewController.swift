
import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
import Fabric
import TwitterKit



class LoginViewController: UIViewController{
    @IBOutlet weak var mailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var displayNameTextField: UITextField!
    var timer: Timer!

    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
    }
    
    func signIn(credential:FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            
            if let error = error {
                // TOOD: エラーハンドリング
                print(error)
                return
            }
            let ProfileRef = FIRDatabase.database().reference(withPath: CommonConst.Profile).child(user!.uid)
            ProfileRef.keepSynced(true)
            // ログインしていたらログイン画面を閉じる
           self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
            let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            
            appDelegate.login()

        }
    }
    
    // 設定 > Twitter画面へ遷移
    func showTwitterSettings() {
        if let url = URL(string: "App-Prefs:root=TWITTER") {
            if #available(iOS 10.0, *) {
                // iOS10以上
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
        }
    }
    
    // 自作ボタンでTwitterログイン
    
    
    // TwitterKitで用意されているログインボタンのセットアップ&配置
    func setup() {
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            
            if let session = session {
                
                let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                self.signIn(credential: credential)
                
            } else {
                print(error)
                // エラー時はまず、アラートを出すのが良いでしょう。
                
                // [アラート] 例↓
                // 「設定 > Twitterより」アカウントを追加してください。
                
                // その後 設定Twitterへ遷移する
                //                self.showTwitterSettings()
            }
        })
        
        // 設定 > Twitterのアカウントを利用する
        logInButton.loginMethods = .systemAccounts
        
        logInButton.center = view.center
        self.view.addSubview(logInButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   
    @IBAction func handleLoginButton(_ sender: AnyObject) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text {
            
            if address.characters.isEmpty || password.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "アカウント作成を済ませてください")
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
                    
                    self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                    
                    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                   
                    appDelegate.login()
               }
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
                                        
                                        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                                        
                                        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                                        let pro = self.storyboard?.instantiateViewController(withIdentifier: "Pro") as! ProViewController
                                        if (pro.imageView.image != nil && pro.name.text!.characters.count > 0){
                                            let ud = UserDefaults.standard
                                            ud.set(true, forKey: CommonConst.IsSavePlofileData)
                                            ud.synchronize()
                                        }

                                        appDelegate.login()
                                    }
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
   
    
    
    
   
        
    
    
    
    
    
    
    
    
    
    
    
    
@IBAction func onTwitterLogin(_ sender: AnyObject) {
    
    Twitter.sharedInstance().logIn(withMethods: [.systemAccounts], completion: { (session, error) in
        if let session = session {
            let credential = FIRTwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
            self.signIn(credential: credential)
        } else {
            print(error)
            // エラー時はまず、アラートを出すのが良いでしょう。
            
            // [アラート] 例↓
            // 「設定 > Twitterより」アカウントを追加してください。
            
            // その後 設定Twitterへ遷移する
            //                self.showTwitterSettings()
            return;
            
        }
        
    })
}



}














    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

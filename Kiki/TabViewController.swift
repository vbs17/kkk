

import UIKit
import Firebase
import FirebaseAuth
import ReachabilitySwift



class TabViewController: UIViewController {
    
    
    
    @IBOutlet weak var home: UIButton!
    @IBOutlet weak var music1: UIButton!
    @IBOutlet weak var recpic1: UIButton!
    @IBOutlet weak var set1: UIButton!
    @IBOutlet weak var pro: UIButton!
    deinit {
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        music1.layer.cornerRadius = 2
        music1.clipsToBounds = true
        music1.layer.borderWidth = 1
        music1.layer.borderColor = UIColor.white.cgColor
        recpic1.layer.cornerRadius = 2
        recpic1.clipsToBounds = true
        recpic1.layer.borderWidth = 1
        recpic1.layer.borderColor = UIColor.white.cgColor
        set1.layer.cornerRadius = 2
        set1.clipsToBounds = true
        set1.layer.borderWidth = 1
        set1.layer.borderColor = UIColor.white.cgColor
        pro.layer.cornerRadius = 2
        pro.clipsToBounds = true
        pro.layer.borderWidth = 1
        pro.layer.borderColor = UIColor.white.cgColor
        home.layer.cornerRadius = 2
        home.clipsToBounds = true
        home.layer.borderWidth = 1
        home.layer.borderColor = UIColor.white.cgColor
    

    }

    
    
    
    var genre:String!
    
    @IBAction func pro(_ sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "Pro")
        self.present(ProViewController!, animated: false, completion: nil)
    }
    @IBAction func path(_ sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "EA")
        self.present(HomeViewController!, animated: false, completion: nil)
    }
    @IBAction func recpic(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeAudio, completionHandler: {(granted: Bool) in
                if granted {
                    DispatchQueue.main.async {
                        let recviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Apiru") as! ApiruViewController
                        self.present(recviewcontroller, animated: true, completion: nil)
                    }
                }
                else {
                    print("no permission")
                }})
            
        } else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.black
        }
        
    }

    @IBAction func HomeGo(_ sender: Any) {
        let setViewController = self.storyboard?.instantiateViewController(withIdentifier: "Itiran")
        self.present(setViewController!, animated: false, completion: nil)
    }
    
    
    @IBAction func music(_ sender: AnyObject) {
        let setViewController = self.storyboard?.instantiateViewController(withIdentifier: "AAA")
        self.present(setViewController!, animated: false, completion: nil)
    }
        override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ud = UserDefaults.standard
        let isTutorial = ud.bool(forKey: CommonConst.IsTutorial )
        if isTutorial == false {
            let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "Tyu")
            self.present(viewController, animated: false, completion: nil)
        }

        
        if FIRAuth.auth()?.currentUser == nil {
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: false, completion: nil)
            }}
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

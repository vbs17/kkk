

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
        home.isEnabled = false
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
       
        
        
        blues.layer.cornerRadius = 5
        blues.clipsToBounds = true
        blues.layer.borderWidth = 3
        blues.layer.borderColor = UIColor.black.cgColor
        rock.layer.cornerRadius = 5
        rock.clipsToBounds = true
        rock.layer.borderWidth = 3
        rock.layer.borderColor = UIColor.black.cgColor
        metal.layer.cornerRadius = 5
        metal.clipsToBounds = true
        metal.layer.borderWidth = 3
        metal.layer.borderColor = UIColor.black.cgColor
        pop.layer.cornerRadius = 5
        pop.clipsToBounds = true
        pop.layer.borderWidth = 3
        pop.layer.borderColor = UIColor.black.cgColor
        ele.layer.cornerRadius = 5
        ele.clipsToBounds = true
        ele.layer.borderWidth = 3
        ele.layer.borderColor = UIColor.black.cgColor
        rb.layer.cornerRadius = 5
        rb.clipsToBounds = true
        rb.layer.borderWidth = 3
        rb.layer.borderColor = UIColor.black.cgColor
        hp.layer.cornerRadius = 5
        hp.clipsToBounds = true
        hp.layer.borderWidth = 3
        hp.layer.borderColor = UIColor.black.cgColor
        jazz.layer.cornerRadius = 5
        jazz.clipsToBounds = true
        jazz.layer.borderWidth = 3
        jazz.layer.borderColor = UIColor.black.cgColor
        cla.layer.cornerRadius = 5
        cla.clipsToBounds = true
        cla.layer.borderWidth = 3
        cla.layer.borderColor = UIColor.black.cgColor
        funk.layer.cornerRadius = 5
        funk.clipsToBounds = true
        funk.layer.borderWidth = 3
        funk.layer.borderColor = UIColor.black.cgColor
        folk.layer.cornerRadius = 5
        folk.clipsToBounds = true
        folk.layer.borderWidth = 3
        folk.layer.borderColor = UIColor.black.cgColor
        coun.layer.cornerRadius = 5
        coun.clipsToBounds = true
        coun.layer.borderWidth = 3
        coun.layer.borderColor = UIColor.black.cgColor

    }

    
    @IBOutlet weak var cla: UIButton!
    @IBOutlet weak var funk: UIButton!
    @IBOutlet weak var folk: UIButton!
    @IBOutlet weak var coun: UIButton!
    @IBOutlet weak var blues: UIButton!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var metal: UIButton!
    @IBOutlet weak var pop: UIButton!
    @IBOutlet weak var ele: UIButton!
    @IBOutlet weak var rb: UIButton!
    @IBOutlet weak var hp: UIButton!
    @IBOutlet weak var jazz: UIButton!
    
    var genre:String!
    
    @IBAction func country(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Country"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

@IBAction func Folk(_ sender: Any) {
    let reachability = Reachability()!
    if reachability.isReachable {
        let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
        genre = "Folk"
        homeviewcontroller.genre = genre
        self.present(homeviewcontroller, animated: true, completion: nil)
        
    } else {
        let alert = UIAlertController()
        let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
        let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
        let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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
    @IBAction func Funk(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Funk"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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
    @IBAction func Cla(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Classical"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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
    
    @IBAction func bl(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Blues"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

        
    
    @IBAction func ro(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Rock"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

    
    @IBAction func elec(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Metal"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

    
    @IBAction func po(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Pop"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

    
    @IBAction func hiphop(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Electronic"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

        //ele
    
    @IBAction func jaz(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "R&B"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

        //rb
    
    @IBAction func folk(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Hip Hop"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

        //hiphop
    
    @IBAction func rb(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Jazz"
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
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

        //jazz
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func pro(_ sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "Pro")
        self.present(ProViewController!, animated: true, completion: nil)
    }
    @IBAction func path(_ sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Itiran1")
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

    
    
    @IBAction func music(_ sender: AnyObject) {
        let setViewController = self.storyboard?.instantiateViewController(withIdentifier: "Itiran")
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



import UIKit
import Firebase
import FirebaseAuth



class TabViewController: UIViewController {
    
    
    
    @IBOutlet weak var music1: UIButton!
    @IBOutlet weak var recpic1: UIButton!
    @IBOutlet weak var set1: UIButton!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var guitar: UIButton!
    deinit {
        
    }
    @IBAction func guitargo(_ sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Ore")
        self.present(HomeViewController!, animated: false, completion: nil)

    }
    @IBAction func pro(_ sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "Pro")
        self.present(ProViewController!, animated: true, completion: nil)
    }
    @IBAction func path(_ sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Itiran1")
        self.present(HomeViewController!, animated: false, completion: nil)
    }
    @IBAction func recpic(_ sender: AnyObject) {
        let TopViewController = self.storyboard?.instantiateViewController(withIdentifier: "Syuru")
        self.present(TopViewController!, animated: true, completion: nil)
    }
    @IBAction func music(_ sender: AnyObject) {
        let setViewController = self.storyboard?.instantiateViewController(withIdentifier: "Itiran")
        self.present(setViewController!, animated: false, completion: nil)
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
        guitar.layer.cornerRadius = guitar.frame.size.width / 2
        guitar.clipsToBounds = true
        guitar.layer.borderWidth = 1
        guitar.layer.borderColor = UIColor.white.cgColor
        pro.layer.cornerRadius = pro.frame.size.width / 2
        pro.clipsToBounds = true
        pro.layer.borderWidth = 1
        pro.layer.borderColor = UIColor.white.cgColor
        print("\(#file) : \(#function)")
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

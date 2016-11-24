

import UIKit
import Firebase
import FirebaseAuth


class TabViewController: UIViewController {
    
    @IBOutlet weak var music1: UIButton!
    @IBOutlet weak var recpic1: UIButton!
    @IBOutlet weak var set1: UIButton!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var guitar: UIButton!
    
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
        recpic1.layer.cornerRadius = 2
        recpic1.clipsToBounds = true
        set1.layer.cornerRadius = 2
        set1.clipsToBounds = true
        guitar.layer.cornerRadius = guitar.frame.size.width / 2
        guitar.clipsToBounds = true
        pro.layer.cornerRadius = pro.frame.size.width / 2
        pro.clipsToBounds = true
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FIRAuth.auth()?.currentUser == nil {
            DispatchQueue.main.async {
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                self.present(loginViewController!, animated: false, completion: nil)
            }
            
        }
    }

    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
   }

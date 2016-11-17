

import UIKit
import Firebase
import FirebaseAuth
import Spring



class TabViewController: UIViewController {
    
    @IBOutlet weak var music1: UIButton!
    @IBOutlet weak var recpic1: UIButton!
    @IBOutlet weak var set1: UIButton!
    @IBOutlet weak var pro: UIButton!
    @IBOutlet weak var guitar: UIButton!
    
    @IBAction func guitargo(sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Ore")
        self.presentViewController(HomeViewController!, animated: false, completion: nil)

    }
    
    @IBAction func pro(sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Pro")
        self.presentViewController(ProViewController!, animated: true, completion: nil)
    }
    
    @IBAction func path(sender: AnyObject) {
        let springButton = sender as! SpringButton
        springButton.animation = "pop"
        springButton.duration = 0.5
        springButton.animate()
        let HomeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Itiran1")
        self.presentViewController(HomeViewController!, animated: false, completion: nil)
    }
    
    
    @IBAction func recpic(sender: AnyObject) {
        let springButton = sender as! SpringButton
        springButton.animation = "pop"
        springButton.duration = 0.5
        springButton.animate()
        let TopViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Syuru")
        self.presentViewController(TopViewController!, animated: true, completion: nil)
    }
    
    @IBAction func music(sender: AnyObject) {
        let springButton = sender as! SpringButton
        springButton.animation = "pop"
        springButton.duration = 0.5
        springButton.animate()
        let setViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Itiran")
        self.presentViewController(setViewController!, animated: false, completion: nil)
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if FIRAuth.auth()?.currentUser == nil {
            dispatch_async(dispatch_get_main_queue()) {
                let loginViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Tyu")
                self.presentViewController(loginViewController!, animated: false, completion: nil)
            }
            
        }
    }

    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
   }
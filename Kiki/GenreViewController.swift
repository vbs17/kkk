


import UIKit
import ReachabilitySwift

class GenreViewController: UIViewController {
    
    @IBOutlet weak var blues: UIButton!
    
    @IBOutlet weak var rock: UIButton!
    
    @IBOutlet weak var metal: UIButton!
    
    @IBOutlet weak var pop: UIButton!
    
    @IBOutlet weak var rb: UIButton!

    @IBOutlet weak var ele: UIButton!
    
    @IBOutlet weak var hiphop: UIButton!
    
    @IBOutlet weak var jazz: UIButton!
    
    @IBOutlet weak var cla: UIButton!
    
    @IBOutlet weak var cou: UIButton!
    
    @IBOutlet weak var folk: UIButton!
    
    @IBOutlet weak var funk: UIButton!
    
    @IBOutlet weak var latin: UIButton!
    
    @IBOutlet weak var other: UIButton!
    
    var genre:String!

    
    @IBAction func blue(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Home11") as! Home11ViewController
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

    
    @IBAction func roc(_ sender: Any) {
    }
    @IBAction func met(_ sender: Any) {
    }
    @IBAction func po(_ sender: Any) {
    }
    @IBAction func el(_ sender: Any) {
    }
    @IBAction func rrbb(_ sender: Any) {
    }
    @IBAction func hh(_ sender: Any) {
    }
    @IBAction func ja(_ sender: Any) {
    }
    @IBAction func cl(_ sender: Any) {
    }
    @IBAction func co(_ sender: Any) {
    }
    @IBAction func fo(_ sender: Any) {
    }
    @IBAction func fu(_ sender: Any) {
    }
    @IBAction func la(_ sender: Any) {
    }
    @IBAction func ot(_ sender: Any) {
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

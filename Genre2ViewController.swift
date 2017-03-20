
import UIKit
import ReachabilitySwift

class Genre2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tt.layer.cornerRadius = 5
        tt.clipsToBounds = true
        tt.layer.borderWidth = 3
        tt.layer.borderColor = UIColor.black.cgColor
        yy.layer.cornerRadius = 5
        yy.clipsToBounds = true
        yy.layer.borderWidth = 3
        yy.layer.borderColor = UIColor.black.cgColor
        cc.layer.cornerRadius = 5
        cc.clipsToBounds = true
        cc.layer.borderWidth = 3
        cc.layer.borderColor = UIColor.black.cgColor

    }

    var genre:String!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var tt: UIButton!

    @IBOutlet weak var yy: UIButton!
  
    @IBOutlet weak var cc: UIButton!
    
    @IBAction func TT(_ sender: Any) {
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

    
    
    @IBAction func YY(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Latin"
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
    
    @IBAction func CC(_ sender: Any) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "HHOO") as! HHHOmeViewController
            genre = "Other"
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
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

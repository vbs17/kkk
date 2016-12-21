


import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProViewController: UIViewController,UITextFieldDelegate{
    
    var image:UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var line: UITextField!
    @IBOutlet weak var twitter: UITextField!
    @IBOutlet weak var face: UITextField!
    @IBOutlet weak var den: UITextField!
    @IBOutlet weak var ta: UITextField!
    @IBOutlet weak var back: UIButton!
    var selectedTextField = UITextField()
    
    
    
    @IBAction func post(_ sender: AnyObject) {
        if (self.imageView.image != nil && name.text!.characters.count > 0){
            let ud = UserDefaults.standard
            ud.set(true, forKey: CommonConst.IsSavePlofileData)
            ud.synchronize()
            let postRef = FIRDatabase.database().reference().child(CommonConst.Profile)
            let size = CGSize(width: 1242, height: 828)
            UIGraphicsBeginImageContext(size)
            imageView.image?.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
            let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            let imageData = UIImageJPEGRepresentation(resizeImage!, 0.5)
            let name1:NSString = name.text as NSString? ?? name.text! as NSString
            let line1:NSString = line.text as NSString? ?? line.text! as NSString
            let twitter1:NSString = twitter.text as NSString? ?? twitter.text! as NSString
            let facebook1: NSString = face.text as NSString? ?? face.text! as NSString
            let den1: NSString = den.text as NSString? ?? den.text! as NSString
            let ta1: NSString = ta.text as NSString? ?? ta.text! as NSString
            let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)! as NSString
            let postData = ["name": name1, "image": imageData!.base64EncodedString(options: .lineLength64Characters), "line": line1, "facebook": facebook1, "twitter":twitter1,"den":den1,"ta":ta1,"uid":uid] as [String : Any]
            postRef.child(uid as String).setValue(postData)
            self.dismiss(animated: true, completion: nil)
        } else{
            if (image != nil && name.text!.characters.count > 0){
                let postRef = FIRDatabase.database().reference().child(CommonConst.Profile)
                let size = CGSize(width: 1242, height: 828)
                UIGraphicsBeginImageContext(size)
                image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
                let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                let imageData = UIImageJPEGRepresentation(resizeImage!, 0.5)
                let name1:NSString = name.text! as NSString
                let line1:NSString = line.text! as NSString
                let twitter1:NSString = twitter.text! as NSString
                let facebook1: NSString = face.text! as NSString
                let den1: NSString = den.text! as NSString
                let ta1: NSString = ta.text! as NSString
                let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)! as NSString
                let postData = ["name": name1, "image": imageData!.base64EncodedString(options: .lineLength64Characters), "line": line1, "facebook": facebook1, "twitter":twitter1,"den":den1,"ta":ta1,"uid":uid] as [String : Any]
                postRef.child(uid as String).setValue(postData)
                self.dismiss(animated: true, completion: nil)
            }else{
                let alert = UIAlertController()
                let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
                alert.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedMessage = NSAttributedString(string: "画像と名前を設定しよう😎", attributes: attributedMessageAttr)
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        imageView.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        self.imageView.image = image
        FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: { snapshot in
            
            let postData = PostData2(snapshot: snapshot, myId: snapshot.key)
            
            if ( postData.uid == FIRAuth.auth()?.currentUser?.uid ) {
                
                if self.image == nil {
                    self.imageView.image = postData.image
                }
                self.name.text = postData.name
                self.line.text = postData.line
                self.twitter.text = postData.twitter
                self.face.text = postData.facebook
                self.den.text = postData.den
                self.ta.text = postData.ta
            }
            else {
            }
        })
        
        FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: { snapshot in
            if ( snapshot.key == FIRAuth.auth()?.currentUser?.uid ) {
                let postData = PostData2(snapshot: snapshot, myId: snapshot.key)
                if self.image == nil {
                    self.imageView.image = postData.image
                }
                self.name.text = postData.name
                self.line.text = postData.line
                self.twitter.text = postData.twitter
                self.face.text = postData.facebook
                self.den.text = postData.den
                self.ta.text = postData.ta
            }
            else {
            }
        })
        
        self.name.delegate = self
        self.line.delegate = self
        self.twitter.delegate = self
        self.face.delegate = self
        self.den.delegate = self
        self.ta.delegate = self
        
    }
    
    @IBAction func proI(_ sender: AnyObject) {
        let proiviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "ProI") as! ProIViewController
        self.present(proiviewcontroller, animated: true, completion: nil)
    }
    
    
    @IBAction func logout(_ sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "Set")
        self.present(HomeViewController!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        restoreScrollViewSize()
    }
    
    func updateScrollViewSize(_ moveSize: CGFloat, duration: TimeInterval) {
        scrollView.contentSize = CGSize(width: 0.0,height: scrollView.frame.size.height + moveSize )
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(duration)
        
        var move = moveSize - selectedTextField.frame.origin.y
        if ( move > 0  ) { move = 0 }
        if ( -move > moveSize ) { move = moveSize }
        
        let contentInsets = UIEdgeInsetsMake(0, 0, abs(move), 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.contentOffset = CGPoint(x: 0, y: abs(move))
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
    }
    
    
    func restoreScrollViewSize() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(SyugoViewController.keyboardWillBeShown(_:)),
                                                         name: NSNotification.Name.UIKeyboardWillShow,
                                                         object: nil)
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(SyugoViewController.keyboardWillBeHidden(_:)),
                                                         name: NSNotification.Name.UIKeyboardWillHide,
                                                         object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,
                                                            name: NSNotification.Name.UIKeyboardWillShow,
                                                            object: nil)
        NotificationCenter.default.removeObserver(self,
                                                            name: NSNotification.Name.UIKeyboardWillHide,
                                                            object: nil)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        selectedTextField = textField
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    
    func keyboardWillBeShown(_ notification: Notification) {
        let userInfo = notification.userInfo
        if let keyboardFrame = (userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue, let animationDuration = (userInfo![UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
            let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
            
            let offsetY: CGFloat = ta.frame.maxY - convertedKeyboardFrame.minY
            updateScrollViewSize(convertedKeyboardFrame.height, duration: animationDuration)
            if offsetY < 0 {
                return
            }
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    





   


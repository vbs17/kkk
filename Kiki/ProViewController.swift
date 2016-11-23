


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
    @IBOutlet weak var imageView1: UIImageView!
    var selectedTextField = UITextField()
    
    
    
    @IBAction func post(sender: AnyObject) {
        if (self.imageView.image != nil && name.text!.characters.count > 0){
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setBool(true, forKey: CommonConst.IsSavePlofileData)
            ud.synchronize()
            let postRef = FIRDatabase.database().reference().child(CommonConst.Profile)
            let imageData = UIImageJPEGRepresentation(image ?? imageView.image!, 0.5)
            let name1:NSString = name.text ?? name.text!
            let line1:NSString = line.text ?? line.text!
            let twitter1:NSString = twitter.text ?? twitter.text!
            let facebook1: NSString = face.text ?? face.text!
            let den1: NSString = den.text ?? den.text!
            let ta1: NSString = ta.text ?? ta.text!
            let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)!
            let postData = ["name": name1, "image": imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength), "line": line1, "facebook": facebook1, "twitter":twitter1,"den":den1,"ta":ta1,"uid":uid]
            postRef.child(uid as String).setValue(postData)
            let tabvarviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Tab") as! TabViewController
            self.presentViewController(tabvarviewcontroller, animated: true, completion: nil)
        } else{
            if (image != nil && name.text!.characters.count > 0){
                let postRef = FIRDatabase.database().reference().child(CommonConst.Profile)
                let imageData = UIImageJPEGRepresentation(image!, 0.5)
                let name1:NSString = name.text!
                let line1:NSString = line.text!
                let twitter1:NSString = twitter.text!
                let facebook1: NSString = face.text!
                let den1: NSString = den.text!
                let ta1: NSString = ta.text!
                let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)!
                let postData = ["name": name1, "image": imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength), "line": line1, "facebook": facebook1, "twitter":twitter1,"den":den1,"ta":ta1,"uid":uid]
                postRef.child(uid as String).setValue(postData)
                let tabvarviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Tab") as! TabViewController
                self.presentViewController(tabvarviewcontroller, animated: true, completion: nil)
            }else{
                let alert = UIAlertController()
                let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellowColor()]
                let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
                alert.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.whiteColor()]
                let attributedMessage = NSAttributedString(string: "画像と名前を設定しよう", attributes: attributedMessageAttr)
                alert.view.tintColor = UIColor.whiteColor()
                alert.setValue(attributedMessage, forKey: "attributedMessage")
                let subview = alert.view.subviews.first! as UIView
                let alertContentView = subview.subviews.first! as UIView
                alertContentView.backgroundColor = UIColor.grayColor()
                
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{
                    (action: UIAlertAction!) -> Void in
                })
                alert.addAction(defaultAction)
                presentViewController(alert, animated: true, completion: nil)
                alert.view.tintColor = UIColor.whiteColor()
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView1.layer.cornerRadius = 75
        imageView1.clipsToBounds = true
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        self.imageView.image = image
        FIRDatabase.database().reference().child(CommonConst.Profile).observeEventType(.ChildAdded, withBlock: { snapshot in
            
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
        
        FIRDatabase.database().reference().child(CommonConst.Profile).observeEventType(.ChildChanged, withBlock: { snapshot in
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
    
    @IBAction func proI(sender: AnyObject) {
        let proiviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("ProI") as! ProIViewController
        self.presentViewController(proiviewcontroller, animated: true, completion: nil)
    }
    
    
    @IBAction func logout(sender: AnyObject) {
        let HomeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Set")
        self.presentViewController(HomeViewController!, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func back(sender: AnyObject) {
        let tabviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Tab") as! TabViewController
        self.presentViewController(tabviewcontroller, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        restoreScrollViewSize()
    }
    
    func updateScrollViewSize(moveSize: CGFloat, duration: NSTimeInterval) {
        scrollView.contentSize = CGSize(width: 0.0,height: scrollView.frame.size.height + moveSize )
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(duration)
        
        var move = moveSize - selectedTextField.frame.origin.y
        if ( move > 0  ) { move = 0 }
        if ( -move > moveSize ) { move = moveSize }
        
        let contentInsets = UIEdgeInsetsMake(0, 0, abs(move), 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.contentOffset = CGPointMake(0, abs(move))
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
        
    }
    
    
    func restoreScrollViewSize() {
        scrollView.contentInset = UIEdgeInsetsZero
        scrollView.scrollIndicatorInsets = UIEdgeInsetsZero
        scrollView.contentOffset = CGPointMake(0, 0)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(SyugoViewController.keyboardWillBeShown(_:)),
                                                         name: UIKeyboardWillShowNotification,
                                                         object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(SyugoViewController.keyboardWillBeHidden(_:)),
                                                         name: UIKeyboardWillHideNotification,
                                                         object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: UIKeyboardWillShowNotification,
                                                            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: UIKeyboardWillHideNotification,
                                                            object: nil)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        selectedTextField = textField
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    
    
    func keyboardWillBeShown(notification: NSNotification) {
        let userInfo = notification.userInfo
        if let keyboardFrame = userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue, let animationDuration = userInfo![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
            let convertedKeyboardFrame = scrollView.convertRect(keyboardFrame, fromView: nil)
            
            let offsetY: CGFloat = CGRectGetMaxY(ta.frame) - CGRectGetMinY(convertedKeyboardFrame)
            updateScrollViewSize(convertedKeyboardFrame.height, duration: animationDuration)
            if offsetY < 0 {
                return
            }
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    





   


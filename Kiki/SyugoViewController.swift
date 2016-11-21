

import UIKit

class SyugoViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {
    
    var image:UIImage!
    
    @IBAction func tapScreen(sender: AnyObject) {
        self.view.endEditing(true)
    }
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hiniti: UITextField!
    @IBOutlet weak var zikoku: UITextField!
    @IBOutlet weak var station: UITextField!
    @IBOutlet weak var path: UITextView!
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var ok: UIButton!
    var selectedTextField:UITextField!
    var isTextView:Bool = false
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing\n")
         selectedTextField = textField
        isTextView = true
        
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func keyboardWillBeShown(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            // もしUITextViewだったら
            if isTextView {
                if let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue, let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
                    restoreScrollViewSize()
                    print("keyboardWillBeShown")
                    let convertedKeyboardFrame = scrollView.convertRect(keyboardFrame, fromView: nil)
                    // selectedTextFieldには現在のtextFieldが設定されているはずなので、それを起点にスクロール
                    let offsetY: CGFloat = CGRectGetMaxY(station.frame) - CGRectGetMinY(convertedKeyboardFrame)
                    if offsetY < 0 {
                        return
                    }
                    updateScrollViewSize(offsetY, duration: animationDuration)
                }
            } else {
                // UITextViewじゃなかったら、
                if let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue, let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue {
                    restoreScrollViewSize()
                    print("keyboardWillBeShown")
                    // UITextView(path)に合わせてスクロール
                    let convertedKeyboardFrame = scrollView.convertRect(keyboardFrame, fromView: nil)
                    let offsetY: CGFloat = CGRectGetMaxY(path.frame) - CGRectGetMinY(convertedKeyboardFrame)
                    if offsetY < 0 {
                        return
                    }
                    updateScrollViewSize(offsetY, duration: animationDuration)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        ok.layer.cornerRadius = 30
        ok.clipsToBounds = true
        hiniti.delegate = self
        zikoku.delegate = self
        station.delegate = self
        path.delegate = self
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        

    }
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool
    {
        lbl.hidden = true
        return true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if(textView.text.isEmpty){
            lbl.hidden = false
        }
    }

    
   
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing\n")
        isTextView = false
        return true
    }

    @IBAction func Ok(sender: AnyObject) {
        if (path.text != nil){
        let kind2viewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Kind2") as! Kind2ViewController
        kind2viewcontroller.hiniti = hiniti
        kind2viewcontroller.image = imageView.image!
        kind2viewcontroller.zikoku = zikoku
        kind2viewcontroller.station = station
        kind2viewcontroller.path = path
            self.presentViewController(kind2viewcontroller, animated: true, completion: nil)}else{
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellowColor()]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            let attributedMessage = NSAttributedString(string: "住所は必須です", attributes: attributedMessageAttr)
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


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
   
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        restoreScrollViewSize()
    }
    
    func updateScrollViewSize(moveSize: CGFloat, duration: NSTimeInterval) {
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(duration)
        
        let contentInsets = UIEdgeInsetsMake(0, 0, moveSize, 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.contentOffset = CGPointMake(0, moveSize)
        
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        isTextView = false
        textField.resignFirstResponder()
    }

    
    func restoreScrollViewSize() {
        scrollView.contentInset = UIEdgeInsetsZero
        scrollView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    

}

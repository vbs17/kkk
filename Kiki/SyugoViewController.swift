

import UIKit

class SyugoViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {
    
    var image:UIImage!
    
    @IBAction func tapScreen(_ sender: AnyObject) {
        self.view.endEditing(true)
         scrollView.contentOffset = CGPoint(x: 0,y :-path.contentInset.top)
    }
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hiniti: UITextField!
    @IBOutlet weak var zikoku: UITextField!
    @IBOutlet weak var station: UITextField!
    @IBOutlet weak var path: UITextView!
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var ok: UIButton!
    var needScrollUp = false
    var animationDuration:TimeInterval = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        hiniti.delegate = self
        zikoku.delegate = self
        station.delegate = self
        path.delegate = self
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
    
    func keyboardWillBeShown(_ notification: Notification) {
        if (needScrollUp) {
            if let userInfo = notification.userInfo {
                if let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue,
                    let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
                    self.animationDuration = animationDuration
                    let keyboardFrame = self.view.convert(keyboardFrame, from: nil)
                    if ok.frame.maxY < keyboardFrame.minY {
                        // スクロール不要
                        return
                    }
                    let moveSize = self.view.frame.size.height - keyboardFrame.minY
                    scrollView.isScrollEnabled = false
                    UIView.animate(withDuration: animationDuration) {
                        let contentInsets = UIEdgeInsetsMake(0, 0, moveSize, 0)
                        self.scrollView.contentInset = contentInsets
                        self.scrollView.scrollIndicatorInsets = contentInsets
                        self.scrollView.contentOffset = CGPoint(x: 0, y: moveSize)
                    }
                }
            }
        }
    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        needScrollUp = false
        UIView.animate(withDuration: self.animationDuration) {
            self.scrollView.contentInset = UIEdgeInsets.zero
            self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        }
    }
    
    // UITextFieldデリゲート
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        scrollView.contentOffset = CGPoint(x: 0,y :-path.contentInset.top)
        print("textFieldShouldBeginEditing\n")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == station) {
            needScrollUp = true
        } else {
            needScrollUp = false
        }
    }
    
    // UITextViewデリゲート
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        needScrollUp = true
        lbl.isHidden = true
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if(textView.text.isEmpty){
            lbl.isHidden = false
        }
    }
    
    @IBAction func Ok(_ sender: AnyObject) {
        if (path.text != nil && path.text != "" && hiniti.text != nil && hiniti.text != "" && zikoku.text != nil && zikoku.text != ""){
            
            let kind2viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Kind2") as! Kind2ViewController
            kind2viewcontroller.hiniti = hiniti.text!
            kind2viewcontroller.image = imageView.image!
            kind2viewcontroller.zikoku = zikoku.text!
            kind2viewcontroller.station = station.text!
            kind2viewcontroller.path = path.text!
            self.present(kind2viewcontroller, animated: true, completion: nil)
        }else{
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellow]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.white]
            let attributedMessage = NSAttributedString(string: "駅以外は必須項目です", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.white
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.gray
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.white
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
}

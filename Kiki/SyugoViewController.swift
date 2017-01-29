

import UIKit

class SyugoViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate  {
    
    var image:UIImage!
    
    @IBAction func tapScreen(_ sender: AnyObject) {
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
    var rect:CGRect!
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing\n")
        selectedTextField = textField
        let displayRect = textField.convert(textField.bounds, to: scrollView)
        rect = displayRect
        isTextView = true
        
    }
    
    func CGPointMake(_ x: CGFloat, _ y: CGFloat)-> CGPoint{
        
        return CGPoint(x: 0,y :0)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func keyboardWillBeShown(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            // もしUITextViewだったら
            if isTextView {
                if let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue, let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
                    restoreScrollViewSize()
                    print("keyboardWillBeShown")
                    let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
                    // selectedTextFieldには現在のtextFieldが設定されているはずなので、それを起点にスクロール
                    let offsetY: CGFloat = station.frame.maxY - convertedKeyboardFrame.minY
                    if offsetY < 0 {
                        return
                    }
                    
                    updateScrollViewSize(offsetY, duration: animationDuration)
                }
            } else {
                // UITextViewじゃなかったら、
                if let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue, let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue {
                    restoreScrollViewSize()
                    print("keyboardWillBeShown")
                    // UITextView(path)に合わせてスクロール
                    let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
                    let offsetY: CGFloat = path.frame.maxY - convertedKeyboardFrame.minY
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
        hiniti.delegate = self
        zikoku.delegate = self
        station.delegate = self
        path.delegate = self
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        restoreScrollViewSize()
    }
    
    func updateScrollViewSize(_ moveSize: CGFloat, duration: TimeInterval) {
        scrollView.contentSize = CGSize(width: 0.0,height: scrollView.frame.size.height + moveSize )
        scrollView.isScrollEnabled = false
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(duration)
        
        if (rect == nil){
            let displayRect = path.convert(path.bounds, to: scrollView)
            rect = displayRect
        }
        var move = moveSize - rect.origin.y - rect.size.height - 30
        if ( move > 0  ) { move = 0 }
        if ( -move > moveSize ) { move = moveSize }
        
        let contentInsets = UIEdgeInsetsMake(0, 0, moveSize, 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.contentOffset = CGPoint(x: 0, y: moveSize)
        UIView.commitAnimations()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isTextView = false
        textField.resignFirstResponder()
    }
    
    func restoreScrollViewSize() {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool
    {
        lbl.isHidden = true
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if(textView.text.isEmpty){
            lbl.isHidden = false
        }
    }
    
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        scrollView.contentOffset = CGPoint(x: 0,y :-path.contentInset.top)
        print("textFieldShouldBeginEditing\n")
        isTextView = false
        return true
    }
    
    @IBAction func Ok(_ sender: AnyObject) {
        if (path.text != nil && path.text != ""){
            
            let kind2viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Kind2") as! Kind2ViewController
            kind2viewcontroller.hiniti = hiniti
            kind2viewcontroller.image = imageView.image!
            kind2viewcontroller.zikoku = zikoku
            kind2viewcontroller.station = station
            kind2viewcontroller.path = path
            self.present(kind2viewcontroller, animated: true, completion: nil)
        }else{
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellow]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.white]
            let attributedMessage = NSAttributedString(string: "住所は必須です", attributes: attributedMessageAttr)
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

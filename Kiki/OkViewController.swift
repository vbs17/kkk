

import UIKit
import AVFoundation

class OkViewController: UIViewController,UITextFieldDelegate {

    var image: UIImage!
    //filenameをsongDataに渡す
    var songData:URL!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var byou: UILabel!
    @IBOutlet weak var back: UIButton!
    var original: NSString?
    var cover:NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sound:AVAudioPlayer = try! AVAudioPlayer(contentsOf: songData!)
        byou.text = formatTimeString(sound.duration)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        back.layer.cornerRadius = 25
        back.clipsToBounds = true
        imageView.image = image
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    //?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func OKGo(_ sender: AnyObject) {
         if (text.text != nil && text.text != ""){
        let kindviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Kind") as! KindViewController
            kindviewcontroller.songData = songData
        kindviewcontroller.image = imageView.image
        kindviewcontroller.byou = byou.text!
        kindviewcontroller.songname = text.text!
        kindviewcontroller.original = self.original
        kindviewcontroller.cover = self.cover
        self.present(kindviewcontroller, animated: true, completion: nil)
         }else{
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string:"曲名を考えよう", attributes: attributedMessageAttr)
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

    //画像は消さなくても更新するから問題ないのか
    @IBAction func backGo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func formatTimeString(_ d: Double) -> String {
        let s: Int = Int(d.truncatingRemainder(dividingBy: 60))
        let m: Int = Int(((d - Double(s)) / 60).truncatingRemainder(dividingBy: 60))
        let str = String(format: "%2d:%02d",  m, s)
        return str
    }


  
}

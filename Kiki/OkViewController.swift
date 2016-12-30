

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
        let kindviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Kind") as! KindViewController
        kindviewcontroller.songData = songData
        kindviewcontroller.image = imageView.image
        kindviewcontroller.byou = byou
        kindviewcontroller.songname = text
        self.present(kindviewcontroller, animated: true, completion: nil)
    }
    //消す
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

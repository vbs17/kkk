

import UIKit

class SentakuVViewController: UIViewController {

    
    var songData:URL!
    var image:UIImage!
    var songname:String!
    var byou:String!
    var original:  NSString?
    var cover: NSString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genre.layer.cornerRadius = 5
        genre.clipsToBounds = true
        genre.layer.borderWidth = 2
        genre.layer.borderColor = UIColor.white.cgColor
        art.layer.cornerRadius = 5
        art.clipsToBounds = true
        art.layer.borderWidth = 2
        art.layer.borderColor = UIColor.white.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var genre: UIButton!

    @IBOutlet weak var art: UIButton!
   
    @IBAction func Genre(_ sender: Any) {
        let kindviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Kind") as! KindViewController
        kindviewcontroller.songData = songData
        kindviewcontroller.image = self.image
        kindviewcontroller.byou = self.byou
        kindviewcontroller.songname = self.songname
        kindviewcontroller.original = self.original
        kindviewcontroller.cover = self.cover
        self.present(kindviewcontroller, animated: true, completion: nil)
        
    }
}

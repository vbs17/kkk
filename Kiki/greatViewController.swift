

import UIKit

class greatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        genre.isEnabled = false
        genre.layer.cornerRadius = 2
        genre.clipsToBounds = true
        genre.layer.borderWidth = 1
        genre.layer.borderColor = UIColor.white.cgColor
        art.layer.cornerRadius = 2
        art.clipsToBounds = true
        art.layer.borderWidth = 1
        art.layer.borderColor = UIColor.white.cgColor
        rec.layer.cornerRadius = 2
        rec.clipsToBounds = true
        rec.layer.borderWidth = 1
        rec.layer.borderColor = UIColor.white.cgColor
        meet.layer.cornerRadius = 2
        meet.clipsToBounds = true
        meet.layer.borderWidth = 1
        meet.layer.borderColor = UIColor.white.cgColor
        pro.layer.cornerRadius = 2
        pro.clipsToBounds = true
        pro.layer.borderWidth = 1
        pro.layer.borderColor = UIColor.white.cgColor
        r.layer.cornerRadius = 2
        r.clipsToBounds = true
        r.layer.borderWidth = 1
        r.layer.borderColor = UIColor.black.cgColor
        b.layer.cornerRadius = 2
        b.clipsToBounds = true
        b.layer.borderWidth = 1
        b.layer.borderColor = UIColor.black.cgColor
        m.layer.cornerRadius = 2
        m.clipsToBounds = true
        m.layer.borderWidth = 1
        m.layer.borderColor = UIColor.black.cgColor
        p.layer.cornerRadius = 2
        p.clipsToBounds = true
        p.layer.borderWidth = 1
        p.layer.borderColor = UIColor.black.cgColor
        e.layer.cornerRadius = 2
        e.clipsToBounds = true
        e.layer.borderWidth = 1
        e.layer.borderColor = UIColor.black.cgColor
        rb.layer.cornerRadius = 2
        rb.clipsToBounds = true
        rb.layer.borderWidth = 1
        rb.layer.borderColor = UIColor.black.cgColor
        h.layer.cornerRadius = 2
        h.clipsToBounds = true
        h.layer.borderWidth = 1
        h.layer.borderColor = UIColor.black.cgColor
        j.layer.cornerRadius = 2
        j.clipsToBounds = true
        j.layer.borderWidth = 1
        j.layer.borderColor = UIColor.black.cgColor











    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var rb: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var genre: UIButton!
    @IBOutlet weak var art: UIButton!
    @IBOutlet weak var rec: UIButton!
    @IBOutlet weak var meet: UIButton!
    @IBOutlet weak var pro: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

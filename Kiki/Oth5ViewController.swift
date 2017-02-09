//
//  Oth5ViewController.swift
//  Kiki
//
//  Created by kei ikeuchi on 2017/02/09.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class Oth5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gog.layer.cornerRadius = 7
        gog.clipsToBounds = true
        gog.layer.borderWidth = 3
        gog.layer.borderColor = UIColor.black.cgColor
       
    }
    @IBOutlet weak var gog: UIButton!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    @IBAction func go(_ sender: Any){
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "oth6")
        self.present(basyoviewcontroller!, animated: true, completion: nil)

    }
}

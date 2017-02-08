//
//  Oth8ViewController.swift
//  Kiki
//
//  Created by kei ikeuchi on 2017/02/09.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class Oth8ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    @IBAction func go(_ sender: Any) {
        let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Set")
        self.present(basyoviewcontroller!, animated: true, completion: nil)

        
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
  
}

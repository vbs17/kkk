//
//  Syutyu4ViewController.swift
//  Kiki
//
//  Created by kei ikeuchi on 2016/11/18.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class Syutyu4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setBool(true, forKey: CommonConst.IsTutorial2)
        ud.synchronize()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(sender: AnyObject) {
        let basyoviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Basyo") as! BasyoViewController
        self.presentViewController(basyoviewcontroller, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
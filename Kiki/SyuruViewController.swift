//
//  SyuruViewController.swift
//  Kiki
//
//  Created by kei ikeuchi on 2016/10/21.
//  Copyright © 2016年 mycompany. All rights reserved.
//

import UIKit

class SyuruViewController: UIViewController {
    @IBOutlet weak var rec: UIButton!
    @IBOutlet weak var syu: UIButton!
    @IBOutlet weak var back: UIButton!
    
    
    @IBAction func rec(sender: AnyObject) {
        let ud = NSUserDefaults.standardUserDefaults()
        
        let isSavePlofile = ud.boolForKey(CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            
            let recviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Top") as! ViewController
            self.presentViewController(recviewcontroller, animated: true, completion: nil)
            
        } else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellowColor()]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            let attributedMessage = NSAttributedString(string: "Home画面に戻って　　　　　　　　　　　　　Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
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
    
    
    

    @IBAction func basyo(sender: AnyObject) {
        let ud = NSUserDefaults.standardUserDefaults()
        
        let isSavePlofile = ud.boolForKey(CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            
            let basyoviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Basyo") as! BasyoViewController
            self.presentViewController(basyoviewcontroller, animated: true, completion: nil)
            
        } else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellowColor()]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            let attributedMessage = NSAttributedString(string: "Home画面に戻って　　　　　　　　　　　　　Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
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
    
    @IBAction func back(sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Tab")
        self.presentViewController(ProViewController!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        rec.layer.cornerRadius = 8
        rec.clipsToBounds = true
        syu.layer.cornerRadius = 8
        syu.clipsToBounds = true
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}

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
    
    
    @IBAction func rec(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            
            let recviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
            self.present(recviewcontroller, animated: true, completion: nil)
            
        } else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellow]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.white]
            let attributedMessage = NSAttributedString(string: "Home画面に戻って　　　　　　　　　　　　　Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
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
    
    
    

    @IBAction func basyo(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            
            let basyoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Basyo") as! BasyoViewController
            self.present(basyoviewcontroller, animated: true, completion: nil)
            
        } else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.yellow]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.white]
            let attributedMessage = NSAttributedString(string: "Home画面に戻って　　　　　　　　　　　　　Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
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
    
    @IBAction func back(_ sender: AnyObject) {
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "Tab")
        self.present(ProViewController!, animated: true, completion: nil)
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

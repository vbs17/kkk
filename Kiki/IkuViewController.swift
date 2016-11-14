

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring

class IkuViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var postArray2:[PostData2] = []
    var join: [String] = []
    var observing = false


    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "IkuTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "IkuT")
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IkuT", forIndexPath: indexPath) as! IkuTableViewCell
        let uid = join[indexPath.row]
        var name:String = ""
        var image:UIImage? = nil
                for id in postArray2{
            if uid == id.uid{
                name = id.name!
                image = cropImageToSquare(id.image!)
            }
        }
        cell.label.text = name
        cell.imageview!.image = image

        return cell
    }
    
    func cropImageToSquare(image:UIImage) -> UIImage? {
        if image.size.width > image.size.height {
            // 横長
            let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(image.size.width/2 - image.size.height/2, 0, image.size.height, image.size.height))
            
            return UIImage(CGImage: cropCGImageRef!)
        } else if image.size.width < image.size.height {
            // 縦長
            let cropCGImageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, image.size.width, image.size.width))
            
            return UIImage(CGImage: cropCGImageRef!)
        } else {
            return image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return join.count
    }
       

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if FIRAuth.auth()?.currentUser != nil {
            if observing == false {
                FIRDatabase.database().reference().child(CommonConst.Profile).observeEventType(.ChildAdded, withBlock: { snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        self.postArray2.insert(postData, atIndex: 0)
                        self.tableView.reloadData()
                    }
                })
                
                FIRDatabase.database().reference().child(CommonConst.Profile).observeEventType(.ChildChanged, withBlock: { snapshot in
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        
                        var index: Int = 0
                        for post in self.postArray2 {
                            if post.id == postData.id {
                                index = self.postArray2.indexOf(post)!
                                break
                            }
                        }
                        self.postArray2.removeAtIndex(index)
                        self.postArray2.insert(postData, atIndex: index)
                        self.tableView.reloadData()
                    }
                })
                
                observing = true
            }
        } else {
            if observing == true {
                postArray2 = []
                tableView.reloadData()
                FIRDatabase.database().reference().removeAllObservers()
                observing = false
            }
        }
    }


    
    

}

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring

class HomeViewController1: UIViewController,UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate{
    var postArray: [PostData1] = []
    var postArray2:[PostData2] = []
    var observing = false
    var genre: String!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var back: UIButton!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell22", forIndexPath: indexPath) as! HomeTableViewCell1
        let uid = FIRAuth.auth()?.currentUser?.uid
        cell.setPostData(postArray[indexPath.row], myid: uid!)
        let postData1 = postArray[indexPath.row]
        var image:UIImage? = nil
        for id in postArray2{
            if postData1.uid == id.uid{
                image = id.image
            }
        }
        cell.imageView1.image = image
        cell.pathGo.addTarget(self, action:#selector(schemebtn(_:event:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.pro.addTarget(self, action:#selector(pro(_:event:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.join.addTarget(self, action:#selector(handleButton(_:event:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.iku.addTarget(self, action:#selector(proiti(_:event:)), forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }
    
    func proiti(sender: UIButton, event:UIEvent) {
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        let postData = postArray[indexPath!.row]
        let pro = self.storyboard?.instantiateViewControllerWithIdentifier("Iku") as! IkuViewController
        pro.join = postData.join
        self.presentViewController(pro, animated: true, completion: nil)
        
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeTableViewCell1", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell22")
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        
    }
    


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if FIRAuth.auth()?.currentUser != nil {
            if observing == false {
                FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre).observeEventType(.ChildAdded, withBlock: { snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData1(snapshot: snapshot, myId: uid)
                        self.postArray.insert(postData, atIndex: 0)
                        self.tableView.reloadData()
                    }
                })
                //ここもfunc hoshiと一緒
                FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre).observeEventType(.ChildChanged, withBlock: { snapshot in
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData1(snapshot: snapshot, myId: uid)
                        
                        var index: Int = 0
                        for post in self.postArray {
                            if post.id == postData.id {
                                index = self.postArray.indexOf(post)!
                                break
                            }
                        }
                        self.postArray.removeAtIndex(index)
                        self.postArray.insert(postData, atIndex: index)
                        self.tableView.reloadData()
                    }
                })
                
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
                postArray = []
                tableView.reloadData()
                FIRDatabase.database().reference().removeAllObservers()
                observing = false
            }
        }
    }
    

    //ここ
    func handleButton(sender: UIButton, event:UIEvent) {
        
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        let postData = postArray[indexPath!.row]
        let ud = NSUserDefaults.standardUserDefaults()
        let isSavePlofile = ud.boolForKey(CommonConst.IsSavePlofileData )
          if isSavePlofile == true {
        if let uid = FIRAuth.auth()?.currentUser?.uid {
            if postData.isLiked {
                
                var index = -1
                for likeId in postData.join {
                    if likeId == uid {
                        index = postData.join.indexOf(likeId)!
                        break
                    }
                }
                let springButton = sender as! SpringButton
                springButton.animation = "shake"
                springButton.duration = 0.5
                springButton.animate()
                postData.join.removeAtIndex(index)
                
            } else {
                let springButton = sender as! SpringButton
                springButton.animation = "shake"
                springButton.duration = 0.5
                springButton.animate()
                postData.join.append(uid)
            }}
            let imageData = UIImageJPEGRepresentation(postData.image!, 0.5)
            let hiniti1 = postData.hiniti!
            let zikoku1 = postData.zikoku!
            let path1 = postData.path!
            let station1 = postData.station!
            let join = postData.join
            let uid = postData.uid!
            let post = ["hiniti": hiniti1, "image": imageData!.base64EncodedStringWithOptions(.Encoding64CharacterLineLength), "zikoku": zikoku1, "station": station1, "path":path1,"uid":uid,"join":join]
            let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre)
            postRef.child(postData.id!).setValue(post)
    }else if isSavePlofile == false {
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




    func schemebtn(sender: UIButton, event:UIEvent) {
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        let postData = postArray[indexPath!.row]
        let adress =  postData.path
        let encodedString = adress!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let url = NSURL(string: "http://maps.apple.com/?q=\(encodedString)")!
        if (UIApplication.sharedApplication().canOpenURL(url)) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
    func pro(sender: UIButton, event:UIEvent) {
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        let postData = postArray[indexPath!.row]
        let pro = self.storyboard?.instantiateViewControllerWithIdentifier("Pi") as! ProIdouViewController
        pro.uid = postData.uid
        self.presentViewController(pro, animated: true, completion: nil)
        
    }
    
    
    

    
    
    
    
    
    func getIndexPath(event:UIEvent) -> NSIndexPath? {
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        return indexPath
    }
    
    
    //無視
    
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // セルをタップされたら何もせずに選択状態を解除する
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    @IBAction func backGo(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}




import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring
import ReachabilitySwift


class Home111ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate{

    
    var postArray: [PostData11] = []
    var postArray2:[PostData2] = []
    var postArray4:[PostData44] = []
    var observing = false
    var genre: String!
    var timer2 = Timer()

    
    let DisplayDataNumber = 2;
    var dataLastVal:Double!

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var back: UIButton!
    
    func mada(){
        label.text = "誰もまだ投稿していません.君の音楽を投稿して一番乗りになろう！"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2222", for: indexPath) as! Home22TableViewCell
        let uid = FIRAuth.auth()?.currentUser?.uid
        //postData1
        cell.setPostData(postArray[indexPath.row], myid: uid!)
        let postData1 = postArray[indexPath.row]
        var image:UIImage? = nil
        //postData2
        for id in postArray2{
            if postData1.uid == id.uid{
                image = id.image
            }
        }
        cell.imageView1.image = image
        
        image = nil
        for postData4 in postArray4{
            if postData1.id == postData4.id {
                image = postData4.image
            }
        }
        cell.ImageView.image = image
        
        FIRDatabase.database().reference().child(CommonConst.image22).child(genre).child(postData1.id!).observeSingleEvent(of: .value, with: {[weak self] snapshot in
            guard let `self` = self else { return }
            //ジャケットのimage
            let postData4 = PostData44(snapshot: snapshot, myId: postData1.uid!)
           
            var index: Int = NSNotFound
            for post in self.postArray4 {
                if post.id == postData4.id {
                    index = self.postArray4.index(of: post)!
                    break
                }
            }
            if index == NSNotFound {
                self.postArray4.append(postData4)
                self.tableView.reloadData()
            }
        })
        
        
        
        cell.pathGo.addTarget(self, action:#selector(schemebtn(_:event:)), for: UIControlEvents.touchUpInside)
        cell.pro.addTarget(self, action:#selector(pro(_:event:)), for: UIControlEvents.touchUpInside)
        cell.join.addTarget(self, action:#selector(handleButton(_:event:)), for: UIControlEvents.touchUpInside)
        cell.iku.addTarget(self, action:#selector(proiti(_:event:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func pro(_ sender: UIButton, event:UIEvent) {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let pro = self.storyboard?.instantiateViewController(withIdentifier: "Pi") as! ProIdouViewController
        pro.uid = postData.uid
        self.present(pro, animated: true, completion: nil)
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentsOffsetYFloat:Float = Float(self.tableView.contentOffset.y)
        let diffFloat:Float = Float(self.tableView.contentSize.height - self.tableView.bounds.size.height)
        let contentsOffsetY:NSDecimalNumber = NSDecimalNumber(value: contentsOffsetYFloat)
        let diff:NSDecimalNumber = NSDecimalNumber(value: diffFloat)
        if(contentsOffsetY.subtracting(diff)==0)
        {
            
            print("scrolling to bottom")
            getFirebaseData()
            
        }
        
    }
    
    func getFirebaseData() {
        let reachability = Reachability()!
        if reachability.isReachable {
        let uid = FIRAuth.auth()?.currentUser?.uid
        print("getFirebaseData")
        
        FIRDatabase.database().reference().child(CommonConst.PostPATH22).child(self.genre).queryOrdered(byChild: "time").queryEnding(atValue: self.dataLastVal).queryLimited(toLast: UInt(DisplayDataNumber)+1).observeSingleEvent(of: .value, with: {[weak self] snapshot in
            guard let `self` = self else { return }
            
            print(snapshot.childrenCount)
            
            var workArray:[PostData11] = []
            for child in snapshot.children.allObjects as! [FIRDataSnapshot]{
                print(child)
                let postData = PostData11(snapshot: child, myId: uid!)
                if postData.time != self.dataLastVal {
                    workArray.insert(postData, at: 0)
                }
            }
            if workArray.count > 0 {
                self.postArray += workArray
                self.tableView.reloadData()
                
                self.dataLastVal = workArray.last!.time!
                print("dataLastVal=\(self.dataLastVal)")
            }
            
            }, withCancel: {(err) in
                print("getFirebaseData error")
        })} else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "😬", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Home22TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell2222")
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        
    }
    
    func getIndexPath(_ event:UIEvent) -> IndexPath? {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer2 = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(Home111ViewController.mada), userInfo: nil, repeats: false)
        let uid = FIRAuth.auth()?.currentUser?.uid
        if observing == false {
            
            FIRDatabase.database().reference().child(CommonConst.PostPATH22).child(genre).queryOrdered(byChild: "time").queryLimited(toLast: UInt(DisplayDataNumber)).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                guard let `self` = self else { return }
                var workArray:[PostData11] = []
                for child in snapshot.children.allObjects as! [FIRDataSnapshot]{
                    print(child )
                    let postData = PostData11(snapshot: child, myId: uid!)
                    print(postData.time ?? "")
                    workArray.insert(postData, at: 0)
                }
                if workArray.count > 0 {
                    self.postArray += workArray
                    self.tableView.reloadData()
                    
                    self.dataLastVal = workArray.last!.time!
                    print("dataLastVal=\(self.dataLastVal)")
                    self.timer2.invalidate()

                }
                
                }, withCancel: {(err) in
                    print("getFirstData error")
            })
            FIRDatabase.database().reference().child(CommonConst.PostPATH22).child(genre).observe(.childChanged, with: {[weak self] snapshot in
                
                if let uid = FIRAuth.auth()?.currentUser?.uid {
                    guard let `self` = self else { return }
                    let postData = PostData11(snapshot: snapshot, myId: uid)
                    
                    var index: Int = 0
                    for post in self.postArray {
                        if post.id == postData.id {
                            index = self.postArray.index(of: post)!
                            break
                        }
                    }
                    
                    self.postArray.remove(at: index)
                    self.postArray.insert(postData, at: index)
                    self.tableView.reloadData()
                    
                }
            })
            
            FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: {[weak self] snapshot in
                
                if let uid = FIRAuth.auth()?.currentUser?.uid {
                    guard let `self` = self else { return }
                    let postData = PostData2(snapshot: snapshot, myId: uid)
                    self.postArray2.insert(postData, at: 0)
                    
                    self.tableView.reloadData()
                }
            })
            FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: {[weak self] snapshot in
                
                if let uid = FIRAuth.auth()?.currentUser?.uid {
                    guard let `self` = self else { return }
                    let postData = PostData2(snapshot: snapshot, myId: uid)
                    var index: Int = 0
                    for post in self.postArray2 {
                        if post.id == postData.id {
                            index = self.postArray2.index(of: post)!
                            break
                        }
                    }
                    self.postArray2.remove(at: index)
                    self.postArray2.insert(postData, at: index)
                    self.tableView.reloadData()
                }
            })
            observing = true
        }
        
    }
    
    
    
    
    
    
    func proiti(_ sender: UIButton, event:UIEvent) {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let pro = self.storyboard?.instantiateViewController(withIdentifier: "Iku") as! IkuViewController
        pro.join = postData.join
        self.present(pro, animated: true, completion: nil)
        
    }
    
    
    func handleButton(_ sender: UIButton, event:UIEvent) {
        
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        //let postData4 = postArray4[indexPath!.row]
        let ud = UserDefaults.standard
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            let reachability = Reachability()!
            if reachability.isReachable {
            if let uid = FIRAuth.auth()?.currentUser?.uid {
                if postData.isLiked {
                    
                    var index = -1

                    for likeId in postData.join {
                        if likeId == uid {
                            index = postData.join.index(of: likeId)!
                            break
                        }
                    }
                    let springButton = sender as! SpringButton
                    springButton.animation = "pop"
                    springButton.duration = 0.4
                    springButton.animate()
                    postData.join.remove(at: index)
                    
                } else {
                    let springButton = sender as! SpringButton
                    springButton.animation = "pop"
                    springButton.duration = 0.4
                    springButton.animate()
                    postData.join.append(uid)
                }}
            //let imageData = UIImageJPEGRepresentation(postData4.image!, 0.5)
            let hiniti1 = postData.hiniti!
            let zikoku1 = postData.zikoku!
            let path1 = postData.path!
            let station1 = postData.station!
            let join = postData.join
            let uid = postData.uid!
            let time = postData.time!
            //let post4 = ["image": imageData!.base64EncodedString(options: .lineLength64Characters)];
            //let postRef2 = FIRDatabase.database().reference().child(CommonConst.image22).child(genre)
            //postRef2.child(postData4.id!).setValue(post4)
            
            let post = ["time":time,"hiniti": hiniti1, "zikoku": zikoku1, "station": station1, "path":path1,"uid":uid,"join":join] as [String : Any]
            let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH22).child(genre)
            postRef.child(postData.id!).setValue(post)
            } else {
                let alert = UIAlertController()
                let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedTitle = NSAttributedString(string: "😬", attributes: attributedTitleAttr)
                alert.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
                alert.view.tintColor = UIColor.black
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
        }else if isSavePlofile == false {
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
    
    
    
    //ここで入力したパスをそのままマップで推移してくれる
    func schemebtn(_ sender: UIButton, event:UIEvent) {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let adress =  postData.path
        let encodedString = adress!.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let url = URL(string: "http://maps.apple.com/?q=\(encodedString)")!
        if (UIApplication.shared.canOpenURL(url)) {
            UIApplication.shared.openURL(url)
        }
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }

    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //音源の方はなんでしなくてもいいのか
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 565
    }

    
}

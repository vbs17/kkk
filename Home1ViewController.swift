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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell22", for: indexPath) as! HomeTableViewCell1
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
        cell.pathGo.addTarget(self, action:#selector(schemebtn(_:event:)), for: UIControlEvents.touchUpInside)
        cell.pro.addTarget(self, action:#selector(pro(_:event:)), for: UIControlEvents.touchUpInside)
        cell.join.addTarget(self, action:#selector(handleButton(_:event:)), for: UIControlEvents.touchUpInside)
        cell.iku.addTarget(self, action:#selector(proiti(_:event:)), for: UIControlEvents.touchUpInside)
        return cell
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

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeTableViewCell1", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell22")
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        
    }
    


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if FIRAuth.auth()?.currentUser != nil {
            if observing == false {
                FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre).observe(.childAdded, with: { snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData1(snapshot: snapshot, myId: uid)
                        self.postArray.insert(postData, at: 0)
                        self.tableView.reloadData()
                    }
                })
                //ここもfunc hoshiと一緒
                FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre).observe(.childChanged, with: { snapshot in
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData1(snapshot: snapshot, myId: uid)
                        
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
                
                FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: { snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        self.postArray2.insert(postData, at: 0)
                        self.tableView.reloadData()
                    }
                })
                
                FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: { snapshot in
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
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
    func handleButton(_ sender: UIButton, event:UIEvent) {
        
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let ud = UserDefaults.standard
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
          if isSavePlofile == true {
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
                springButton.animation = "shake"
                springButton.duration = 0.5
                springButton.animate()
                postData.join.remove(at: index)
                
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
            let post = ["hiniti": hiniti1, "image": imageData!.base64EncodedString(options: .lineLength64Characters), "zikoku": zikoku1, "station": station1, "path":path1,"uid":uid,"join":join] as [String : Any]
            let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH2).child(genre)
            postRef.child(postData.id!).setValue(post)
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
    
    
    func pro(_ sender: UIButton, event:UIEvent) {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let pro = self.storyboard?.instantiateViewController(withIdentifier: "Pi") as! ProIdouViewController
        pro.uid = postData.uid
        self.present(pro, animated: true, completion: nil)
        
    }
    
    
    

    
    
    
    
    
    func getIndexPath(_ event:UIEvent) -> IndexPath? {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    
    //無視
    
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // セルをタップされたら何もせずに選択状態を解除する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func backGo(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring
import SVProgressHUD
import ReachabilitySwift

class HHHOmeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate {
    var postArray: [PostData111] = []
    var postArray2:[Post2Data2] = []
    var postArray3:[Post4Data4] = []
    var observing = false
    var genre: String!
    var playSong:AVAudioPlayer!
    var timer = Timer()
    var timer2 = Timer()
    var playingIndexPath:IndexPath!
    var dataLastVal:Double!
    let DisplayDataNumber = 2;

    
    @IBOutlet weak var labek: UILabel!
    @IBAction func Button(_ sender: Any) {
        timer.invalidate()
        timer2.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if presentedViewController == nil {
            SVProgressHUD.dismiss()
            observing = false
            self.view.removeFromSuperview()
            FIRDatabase.database().reference().removeAllObservers()
            if playSong != nil {
                playSong.stop()
                timer.invalidate()
            }
        }
    }

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HHOOO", for: indexPath) as! HHOOTableViewCell
        //cell.hyouka.setTitleColor(UIColor.white, for: UIControlState())
        cell.hyouka.setTitleColor(UIColor.black, for: UIControlState())
        cell.edittingFlag = false
        cell.star1.isUserInteractionEnabled = false
        cell.star2.isUserInteractionEnabled = false
        cell.star3.isUserInteractionEnabled = false
        cell.star4.isUserInteractionEnabled = false
        cell.star5.isUserInteractionEnabled = false
        if (playingIndexPath != nil) && (indexPath == playingIndexPath) {
            cell.backButton.isEnabled = true
        } else {//それ以外のセル
            cell.nami.progress = 0
            cell.onLabel.text = "0:00"
            cell.backButton.isEnabled = false
        }
        //100個あるなら100個分のデータを表示させる
        cell.setPostData(postArray[indexPath.row])
        let postData1 = postArray[indexPath.row]
        var image:UIImage? = nil
        //profileのimage設置
        for id in postArray2{
            if postData1.uid == id.uid{
                image = id.image
            }
        }
        cell.imageView1.image = image
        // ジャケットのimage設置
        image = nil
        for postData3 in postArray3{
            if postData1.id == postData3.id {
                image = postData3.image
            }
        }
        cell.imageViewView.image = image
        if (image == nil) {
            // Firebaseからイメージ読み込み                                                    //post
            FIRDatabase.database().reference().child(CommonConst.image11).child(genre).child(postData1.id!).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                guard let `self` = self else { return }
                //ジャケットのimage
                let postData3 = Post4Data4(snapshot: snapshot, myId: postData1.uid!)
                // すでに登録済みでなければ登録
                //ここわからん
                //このおかげでデータの取得するかどうか判別できるようになるとかかも
                var index: Int = NSNotFound
                for post in self.postArray3 {
                    if post.id == postData3.id {
                        index = self.postArray3.index(of: post)!
                        break
                    }
                }
                if index == NSNotFound {
                    self.postArray3.append(postData3)
                    self.tableView.reloadData()
                }
            })
        }
        
        cell.goButton.addTarget(self, action: #selector(pro(_:event:)), for: UIControlEvents.touchUpInside)
        cell.playButton.addTarget(self, action:#selector(handleButton(_:event:)), for: UIControlEvents.touchUpInside)
        cell.backButton.addTarget(self, action:#selector(back(_:event:)), for: UIControlEvents.touchUpInside)
        cell.star1.addTarget(self, action: #selector(hoshi(_:event:)), for: UIControlEvents.touchUpInside)
        cell.star2.addTarget(self, action: #selector(hoshi(_:event:)), for: UIControlEvents.touchUpInside)
        cell.star3.addTarget(self, action: #selector(hoshi(_:event:)), for: UIControlEvents.touchUpInside)
        cell.star4.addTarget(self, action: #selector(hoshi(_:event:)), for: UIControlEvents.touchUpInside)
        cell.star5.addTarget(self, action: #selector(hoshi(_:event:)), for: UIControlEvents.touchUpInside)
        cell.hyouka.addTarget(self, action: #selector(hyoukaGo), for: UIControlEvents.touchUpInside)
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
    
    //スクロールしてデータ取得
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
            
            FIRDatabase.database().reference().child(CommonConst.PostPATH11).child(self.genre).queryOrdered(byChild: "time").queryEnding(atValue: self.dataLastVal).queryLimited(toLast: UInt(DisplayDataNumber)+1).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                guard let `self` = self else { return }
                
                print(snapshot.childrenCount)
                
                var workArray:[PostData111] = []
                for child in snapshot.children.allObjects as! [FIRDataSnapshot]{
                    print(child)
                    let postData = PostData111(snapshot: child, myId: uid!)
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
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.black
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HHOOTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HHOOO")
        //ここ？button
        button.layer.cornerRadius = 37
        button.clipsToBounds = true
        let tblBackColor: UIColor = UIColor.clear
        tableView.backgroundColor = tblBackColor
        
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
        } catch  {
            // エラー処理
            fatalError("カテゴリ設定失敗")
        }
        
        // sessionのアクティブ化
        do {
            try session.setActive(true)
        } catch {
            // audio session有効化失敗時の処理
            // (ここではエラーとして停止している）
            fatalError("session有効化失敗")
        }
    }
    
    
    
    func getIndexPath(_ event:UIEvent) -> IndexPath? {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        timer2 = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(HHHOmeViewController.mada), userInfo: nil, repeats: false)
        
        
        let uid = FIRAuth.auth()?.currentUser?.uid
        
        if observing == false {
            FIRDatabase.database().reference().child(CommonConst.PostPATH11).child(genre).queryOrdered(byChild: "time").queryLimited(toLast: UInt(DisplayDataNumber)).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                guard let `self` = self else { return }
                
                
                var workArray:[PostData111] = []
                for child in snapshot.children.allObjects as! [FIRDataSnapshot]{
                    print(child )
                    let postData = PostData111(snapshot: child, myId: uid!)
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
            
            FIRDatabase.database().reference().child(CommonConst.PostPATH11).child(genre).observe(.childChanged, with: {[weak self] snapshot in
                
                if let uid = FIRAuth.auth()?.currentUser?.uid {
                    guard let `self` = self else { return }
                    let postData = PostData111(snapshot: snapshot, myId: uid)
                    
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
                    let postData = Post2Data2(snapshot: snapshot, myId: uid)
                    self.postArray2.insert(postData, at: 0)
                    
                    self.tableView.reloadData()
                }
            })
            FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: {[weak self] snapshot in
                
                if let uid = FIRAuth.auth()?.currentUser?.uid {
                    guard let `self` = self else { return }
                    let postData = Post2Data2(snapshot: snapshot, myId: uid)
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
    
    func hyoukaGo(_ sender:UIButton, event:UIEvent){
        let indexPath = getIndexPath(event)
        let cell = tableView.cellForRow(at: indexPath!) as! HHOOTableViewCell?
        let ud = UserDefaults.standard
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            if cell!.edittingFlag == false{
                //cell!.hyouka.setTitleColor(UIColor.yellow, for: UIControlState())
                cell!.hyouka.setTitleColor(UIColor.yellow, for: UIControlState())
                cell!.edittingFlag = true
                cell!.star1.isUserInteractionEnabled = true
                cell!.star2.isUserInteractionEnabled = true
                cell!.star3.isUserInteractionEnabled = true
                cell!.star4.isUserInteractionEnabled = true
                cell!.star5.isUserInteractionEnabled = true
                cell?.star1.setImage(UIImage(named:"sister7"), for: UIControlState())
                cell?.star2.setImage(UIImage(named:"sister7"), for: UIControlState())
                cell?.star3.setImage(UIImage(named:"sister7"), for: UIControlState())
                cell?.star4.setImage(UIImage(named:"sister7"), for: UIControlState())
                cell?.star5.setImage(UIImage(named:"sister7"), for: UIControlState())
                
            } else if cell!.edittingFlag == true{
                //cell!.hyouka.setTitleColor(UIColor.white, for: UIControlState())
                cell!.hyouka.setTitleColor(UIColor.black, for: UIControlState())
                cell!.edittingFlag = false
                cell?.setPostData1(self.postArray[indexPath!.row])
                cell!.star1.isUserInteractionEnabled = false
                cell!.star2.isUserInteractionEnabled = false
                cell!.star3.isUserInteractionEnabled = false
                cell!.star4.isUserInteractionEnabled = false
                cell!.star5.isUserInteractionEnabled = false
                
            }
        }else if isSavePlofile == false {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "Home画面に戻って　　　　　　　　　　　　　Profileで画像と名前を設定しよう", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.black
        }}
    
    func hoshi(_ sender: UIButton, event:UIEvent){
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let cell = tableView.cellForRow(at: indexPath!) as! HHOOTableViewCell?
        //cell!.hyouka.setTitleColor(UIColor.yellow, for: UIControlState())
        cell!.hyouka.setTitleColor(UIColor.black, for: UIControlState())
        if let uid = FIRAuth.auth()?.currentUser?.uid {
            var index = -1 //0からpostData.star.count(postData.star.countは含まない)
            for i in (0 ..< postData.star.count) {
                
                let starDic = Array(postData.star[i].keys)
                // star配列の中から 自分が投票したデータを探す
                if starDic[0] == uid{
                    index = i
                    break
                }
            }
            // -1 の場合は削除対象のデータが無い
            if index != -1 {//例えば3つ星タップしてたとして再度評価したらそれを消して再度保存しな一人で総数100回とか出来てまうから
                postData.star.remove(at: index)
            }
            //何個星タップしたかpostData.starに保存
            postData.star.append([uid:String(sender.tag)])
        }
        //cell!.hyouka.setTitleColor(UIColor.black, for: UIControlState())
        cell!.edittingFlag = false
        cell?.setPostData1(self.postArray[indexPath!.row])
        cell!.star1.isUserInteractionEnabled = false
        cell!.star2.isUserInteractionEnabled = false
        cell!.star3.isUserInteractionEnabled = false
        cell!.star4.isUserInteractionEnabled = false
        cell!.star5.isUserInteractionEnabled = false
        
        
        
        let name = postData.name
        let song = postData.song
        let byou = postData.byou
        let star = postData.star //97行目
        let time = postData.time
        let original = postData.original
        let cover = postData.cover
        let uid:NSString = postData.uid! as NSString
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH11).child(genre)
        let postData2 = ["time":time!,"songname":name!,"ongen":song!,"byou":byou!,"star":star,"original":original!,"cover":cover!,"uid":uid] as [String : Any]
        postRef.child(postData.id!).setValue(postData2)
    }
    
    func mada(){
        labek.text = "接続状態が不安定です"
    }
    
    
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    
    
    func handleButton(_ sender: UIButton, event:UIEvent){
        let reachability = Reachability()!
        if reachability.isReachable {
            let touch = event.allTouches?.first
            let point = touch!.location(in: self.tableView)
            let indexPath = tableView.indexPathForRow(at: point)
            let postData = postArray[indexPath!.row]
            let cell = tableView.cellForRow(at: indexPath!) as! HHOOTableViewCell?
            //cell?.backButton.isEnabled = true
            if indexPath == playingIndexPath{
                if playSong.isPlaying == true{
                    playSong.stop()
                    timer.invalidate()
                }else{
                    timer.invalidate()
                    playSong.play()
                    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HHHOmeViewController.updatePlayingTime), userInfo: nil, repeats: true)
                }
            } else { //他の曲を再生した時再生中の曲がこうなる
                if playingIndexPath != nil {
                    let cell = tableView.cellForRow(at: playingIndexPath) as! HHOOTableViewCell?
                    if cell != nil {
                        playSong.stop()
                        cell!.nami.progress = 0
                        cell!.onLabel.text = "0:00"
                        cell?.backButton.isEnabled = false
                    }}
                
                timer.invalidate()
                
                //ここもポイント
                cell?.playButton.isEnabled = false
                cell?.hyouka.isEnabled = false
                cell?.goButton.isEnabled = false
                tableView.isUserInteractionEnabled = false
                SVProgressHUD.setDefaultMaskType(.none)
                SVProgressHUD.show(withStatus:"クールな音質に仕上げています😎(最大5秒) 　　　　　　　　　　　　　　　　                　　　　　　このソングが君のセンスにあえば左上のProfileボタンをタップして俺に連絡をとってくれ😎あ、あと最高のヘッドホンで聞いてくれよな😜")

                FIRDatabase.database().reference().child(CommonConst.songData11).child(postData.song!).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                    guard let `self` = self else { return }
                    if self.observing == false {
                        return
                    }
                    SVProgressHUD.dismiss()
                    cell?.playButton.isEnabled = true
                    cell?.hyouka.isEnabled = true
                    cell?.goButton.isEnabled = true
                    self.tableView.isUserInteractionEnabled = true
                    
                    
                    if self.presentedViewController != nil {
                        return
                    }
                    self.playingIndexPath = indexPath
                    let realsong = snapshot.value as! String
                    let tap = Data(base64Encoded: realsong, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                    self.playSong = try! AVAudioPlayer(data:tap!)
                    self.playSong.delegate = self
                    cell!.playSong = self.playSong
                    self.playSong.prepareToPlay()
                    self.playSong.play()
                    self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HHHOmeViewController.updatePlayingTime), userInfo: nil, repeats: true)
                    cell?.backButton.isEnabled = true
                })
            } } else {
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.black
            
        }
    }
    
    func back(_ sender: UIButton, event:UIEvent) {
        
        let cell = tableView.cellForRow(at: playingIndexPath) as! HHOOTableViewCell?
        cell!.onLabel.text = "0:00"
        
        playSong.stop()
        timer.invalidate()
        playSong.prepareToPlay()
        playSong.currentTime = 0
        playSong.play()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HHHOmeViewController.updatePlayingTime), userInfo: nil, repeats: true)
    }
    
    func formatTimeString(_ d: Double) -> String {
        let s: Int = Int(d.truncatingRemainder(dividingBy: 60))
        let m: Int = Int(((d - Double(s)) / 60).truncatingRemainder(dividingBy: 60))
        let str = String(format: "%2d:%02d",  m, s)
        return str
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func updatePlayingTime() {
        let cell = tableView.cellForRow(at: playingIndexPath) as! HHOOTableViewCell?
        if (cell != nil) && (playSong.currentTime >= 0.1) {
            cell!.onLabel.text = formatTimeString(playSong.currentTime)
            cell!.nami.progress = Float(playSong.currentTime / playSong.duration)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let cell = tableView.cellForRow(at: playingIndexPath) as! HHOOTableViewCell?
        timer.invalidate()
        if cell != nil {
            cell!.onLabel.text = formatTimeString(playSong.duration)
            cell!.nami.progress = 0
        }
    }
}

    

   





import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring
import SVProgressHUD

class HomeViewController: UIViewController,UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate{
    var postArray: [PostData] = []
    var postArray2:[PostData2] = []
    var observing = false
    var genre: String!
    var playSong:AVAudioPlayer!
    var timer = Timer()
    var timer2 = Timer()
    var back: UIButton!
    var tableView: UITableView!
    var playingIndexPath:IndexPath!
    var ko = false
    @IBOutlet weak var lbl: UILabel!
    
    func pro(_ sender: UIButton, event:UIEvent) {
        ko = true
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        if playSong != nil {
            if (playSong.isPlaying){
                playSong.pause()
                timer.invalidate()
            }
        }
        let pro = self.storyboard?.instantiateViewController(withIdentifier: "Pi") as! ProIdouViewController
        pro.uid = postData.uid
        self.present(pro, animated: true, completion: nil)
        
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CEll")
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        let tblBackColor: UIColor = UIColor.clear
        tableView.backgroundColor = tblBackColor
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayback)
        } catch  {
            // エラー処理
        }
        
        // sessionのアクティブ化
        do {
            try session.setActive(true)
        } catch {
            // audio session有効化失敗時の処理
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CEll", for: indexPath) as! HomeTableViewCell
        cell.hyouka.setTitleColor(UIColor.white, for: UIControlState())
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
            cell.onlabel2.text = "0:00"
            cell.backButton.isEnabled = false
        }
        cell.setPostData(postArray[indexPath.row])
        let postData1 = postArray[indexPath.row]
        var image:UIImage? = nil
        for id in postArray2{
            if postData1.uid == id.uid{
                image = id.image
            }
        }
        cell.imageView1.image = image

        cell.go.addTarget(self, action: #selector(pro(_:event:)), for: UIControlEvents.touchUpInside)
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
    
    
    func getIndexPath(_ event:UIEvent) -> IndexPath? {
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        return indexPath
    }
    //ここが怪しい
    func hyoukaGo(_ sender:UIButton, event:UIEvent){
        let indexPath = getIndexPath(event)
        let cell = tableView.cellForRow(at: indexPath!) as! HomeTableViewCell?
        let ud = UserDefaults.standard
        let isSavePlofile = ud.bool(forKey: CommonConst.IsSavePlofileData )
        if isSavePlofile == true {
            if cell!.edittingFlag == false{
                cell!.hyouka.setTitleColor(UIColor.yellow, for: UIControlState())
                cell!.edittingFlag = true
                cell!.star1.isUserInteractionEnabled = true
                cell!.star2.isUserInteractionEnabled = true
                cell!.star3.isUserInteractionEnabled = true
                cell!.star4.isUserInteractionEnabled = true
                cell!.star5.isUserInteractionEnabled = true
                cell?.star1.setImage(UIImage(named:"IMG_2728 2"), for: UIControlState())
                cell?.star2.setImage(UIImage(named:"IMG_2728 2"), for: UIControlState())
                cell?.star3.setImage(UIImage(named:"IMG_2728 2"), for: UIControlState())
                cell?.star4.setImage(UIImage(named:"IMG_2728 2"), for: UIControlState())
                cell?.star5.setImage(UIImage(named:"IMG_2728 2"), for: UIControlState())
            } else if cell!.edittingFlag == true{
                cell!.hyouka.setTitleColor(UIColor.white, for: UIControlState())
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
        }}
    
    //ここが怪しいhoshiした後に文字が赤なのはおかしい
    func hoshi(_ sender: UIButton, event:UIEvent){
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let cell = tableView.cellForRow(at: indexPath!) as! HomeTableViewCell?
        cell!.hyouka.setTitleColor(UIColor.yellow, for: UIControlState())

        if let uid = FIRAuth.auth()?.currentUser?.uid {
            var index = -1 //0からpostData.star.count(postData.star.countは含まない)
            for var i in (0 ..< postData.star.count) {
                
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
        cell!.hyouka.setTitleColor(UIColor.black, for: UIControlState())
                        cell!.edittingFlag = false
                        cell?.setPostData1(self.postArray[indexPath!.row])
                        cell!.star1.isUserInteractionEnabled = false
                        cell!.star2.isUserInteractionEnabled = false
                        cell!.star3.isUserInteractionEnabled = false
                        cell!.star4.isUserInteractionEnabled = false
                        cell!.star5.isUserInteractionEnabled = false
       
        //どこのgenreのどのセルに星がついたか保存しなあかん
        //どこでgenreの場所決めてるのか
       
        let name = postData.name
        let song = postData.song
        let byou = postData.byou
        let star = postData.star //97行目
        let uid:NSString = postData.uid! as NSString
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH).child(genre)
        let postData2 = ["songname":name!,"ongen":song!,"byou":byou!,"star":star,"uid":uid] as [String : Any]
        postRef.child(postData.id!).setValue(postData2)
    }

    func mada(){
        lbl.text = "誰もまだ投稿していません"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer2 = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(HomeViewController.mada), userInfo: nil, repeats: false)
        if FIRAuth.auth()?.currentUser != nil {
            if observing == false {
                //俺が新しくできた
                FIRDatabase.database().reference().child(CommonConst.PostPATH).child(genre).observe(.childAdded, with: {[weak self] snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        guard let `self` = self else { return }
                        let postData = PostData(snapshot: snapshot, myId: uid)
                        self.postArray.insert(postData, at: 0)
                        
                        if self.playingIndexPath != nil {
                            let row = self.playingIndexPath.row
                            self.playingIndexPath = IndexPath(row: row+1, section: 0)
                        }
                        self.timer2.invalidate()
                        self.tableView.reloadData()
                    }
                })
//俺だけが変更した 一個だけていう考えで考えてみ　一気に１つ以上の投稿に星はたっぷできんのやし
                FIRDatabase.database().reference().child(CommonConst.PostPATH).child(genre).observe(.childChanged, with: {[weak self] snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        guard let `self` = self else { return }
                        let postData = PostData(snapshot: snapshot, myId: uid)
                        
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
                //俺が新しくできた　言うたらこれは一回のみでしょ？上は何回もできるけど
                FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: {[weak self] snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        guard let `self` = self else { return }
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        self.postArray2.insert(postData, at: 0)
                        
                        self.tableView.reloadData()
                    }
                })
                //俺だけが変更した　これがあるから他の人は何も変わらずまま自分だけ変わる　１以上の投稿の場合も大丈夫なのか
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
                        //なんでindexは1以上も対応できているのか
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (ko == true){
            return 0
        }else{
        return postArray.count
        }
    }
    
   

    
    func handleButton(_ sender: UIButton, event:UIEvent){
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        let postData = postArray[indexPath!.row]
        let cell = tableView.cellForRow(at: indexPath!) as! HomeTableViewCell?
        cell?.backButton.isEnabled = true
        if indexPath == playingIndexPath{
            if playSong.isPlaying == true{
                playSong.pause()
                timer.invalidate()
            }else{
                timer.invalidate()
                playSong.play()
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomeViewController.updatePlayingTime), userInfo: nil, repeats: true)
            }
        } else { //他の曲を再生した時再生中の曲がこうなる
            if playingIndexPath != nil {
                let cell = tableView.cellForRow(at: playingIndexPath) as! HomeTableViewCell?
                if cell != nil {
                    cell!.nami.progress = 0
                    cell!.onlabel2.text = "0:00"
                    cell?.backButton.isEnabled = false
                }}
            
            timer.invalidate()
            playingIndexPath = indexPath
            //ここもポイント
            SVProgressHUD.show(withStatus: "   最高にクールな音質に仕上げています😉(最大5秒)                 こいつのオリジナルソングがお前のセンスにあえば左上のProfileボタンをタップして連絡とれ😎")
            
            FIRDatabase.database().reference().child(CommonConst.songData).child(postData.song!).observeSingleEvent(of: .value, with: {[weak self] snapshot in
                guard let `self` = self else { return }
                SVProgressHUD.dismiss()
                let realsong = snapshot.value as! String
                let tap = Data(base64Encoded: realsong, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                self.playSong = try! AVAudioPlayer(data:tap!)
                self.playSong.delegate = self
                cell!.playSong = self.playSong
                self.playSong.prepareToPlay()
                self.playSong.play()
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomeViewController.updatePlayingTime), userInfo: nil, repeats: true)
                  })
        }
    }
    
    func back(_ sender: UIButton, event:UIEvent) {
        
        let cell = tableView.cellForRow(at: playingIndexPath) as! HomeTableViewCell?
        cell!.onlabel2.text = "0:00"
      
        playSong.stop()
        timer.invalidate()
        playSong.prepareToPlay()
        playSong.currentTime = 0
        playSong.play()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(HomeViewController.updatePlayingTime), userInfo: nil, repeats: true)
        }
    
    func formatTimeString(_ d: Double) -> String {
        let s: Int = Int(d.truncatingRemainder(dividingBy: 60))
        let m: Int = Int(((d - Double(s)) / 60).truncatingRemainder(dividingBy: 60))
        let str = String(format: "%2d:%02d",  m, s)
        return str
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //全部大丈夫なのか
    @IBAction func backGo(_ sender: AnyObject) {
        ko = true
        timer.invalidate()
        timer2.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    
    func updatePlayingTime() {
        let cell = tableView.cellForRow(at: playingIndexPath) as! HomeTableViewCell?
        if (cell != nil) && (playSong.currentTime >= 0.1) {
            cell!.onlabel2.text = formatTimeString(playSong.currentTime)
            cell!.nami.progress = Float(playSong.currentTime / playSong.duration)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let cell = tableView.cellForRow(at: playingIndexPath) as! HomeTableViewCell?
        timer.invalidate()
        if cell != nil {
            cell!.onlabel2.text = formatTimeString(playSong.duration)
            cell!.nami.progress = 0
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if playSong != nil {
            playSong.stop()
            timer.invalidate()
        }else{
            
        }
    }
}





import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD
import ReachabilitySwift

class Kind1122ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, Kind1122TableViewCellDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let AllItems: [[String]]  = [["Rock",
                                  "Blues",
                                  "Country",
                                  "Folk",
                                  "Pop",
                                  "Metal",
                                  "Electronic",
                                  "R&B",
                                  "Reggae",
                                  "Hip Hop",
                                  "Funk",
                                  "Jazz",
                                  "Classical",
                                  "Latin",
                                  "Other"
                                  
    ]]
    
     fileprivate let mySections: NSArray = ["Genre"]

    var songData:URL!
    var image:UIImage!
    var songname:String!
    var byou:String!
    var genre = ""
    var tappedCellPos:IndexPath! //タップされたCellのindexPath
    var buttonOriginalColor:UIColor!//ボタンの元の色
    var isRowSelected:Bool = false//現在行が選択状態か否か
    var original:  NSString?
    var cover: NSString?
    
    override func viewWillAppear(_ animated: Bool) {
        tappedCellPos = nil
        genre = ""
        isRowSelected = false
        tableView.reloadData()
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Kind1122TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CCCell")
        tappedCellPos = nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CCCell", for: indexPath) as! Kind1122TableViewCell
        cell.delegate = self
        //ここ
        cell.button.backgroundColor = UIColor.lightGray
        if (tappedCellPos != nil){
            if (tappedCellPos == indexPath){
                cell.button.backgroundColor = UIColor.green
            }
        }
        let items = AllItems[indexPath.section][indexPath.row]
        cell.label.text = items
        return cell
    }
    
    func buttonPressed(_ tableViewCell: Kind1122TableViewCell) {
        let indexPath = tableView.indexPath(for: tableViewCell)
        // 初めてのタップ
        if tappedCellPos == nil {
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.button.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.button.backgroundColor = UIColor.green
            // ジャンルを決定
            genre = AllItems[indexPath!.section][indexPath!.row]
            // 行が選択されている
            isRowSelected = true
            // タップされたセルのindexPathを保存
            tappedCellPos = indexPath
        } else if tappedCellPos == indexPath {
            // 同じセルのn度目のタップ
            // 行が選択された状態なら、元に戻す
            if isRowSelected {
                // ボタンの色を元の色に
                tableViewCell.button.backgroundColor = buttonOriginalColor
                // ジャンルを未選択（空文字）に
                genre = ""
                // 行が非選択状態とする
                isRowSelected = false
                // タップされたセルのindexPathを保存
                tappedCellPos = indexPath
            } else {
                // 行が非選択の状態なら、選択状態にする
                // オリジナルのボタンの色を取得
                buttonOriginalColor = tableViewCell.button.backgroundColor!
                // ボタンの色を緑に。
                tableViewCell.button.backgroundColor = UIColor.green
                // ジャンルを決定
                genre = AllItems[indexPath!.section][indexPath!.row]
                // 行が選択されている
                isRowSelected = true
                // タップされたセルのindexPathを保存
                tappedCellPos = indexPath
            }
        } else {
            // 他の行がタップされた
            // 既に選択状態の行がある
            if isRowSelected {
                if ((tableView.cellForRow(at: tappedCellPos)) != nil){
                    // 既に選択状態の行の選択を解除
                    let oldCell:Kind1122TableViewCell = tableView.cellForRow(at: tappedCellPos) as! Kind1122TableViewCell
                    oldCell.button.backgroundColor = buttonOriginalColor;
                    
                }
            }            // 今回選択された行を選択状態とする
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.button.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.button.backgroundColor = UIColor.green
            // ジャンルを決定
            genre = AllItems[indexPath!.section][indexPath!.row]
            // 行が選択されている
            isRowSelected = true
            // タップされたセルのindexPathを保存
            tappedCellPos = indexPath
        }
        
    }
    

    
    @IBAction func post(_ sender: Any) {
        if isRowSelected {
            let reachability = Reachability()!
            if reachability.isReachable {
                let ongen = UUID().uuidString
                print("Post")
                saveSong(ongen)
                print("saveSong")
                SVProgressHUD.setDefaultMaskType(.clear)
                SVProgressHUD.show()
            } else {
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
            
            // セルが選択されている時の処理を記述
            
        } else {
            // 行が選択されていない＝ジャンルが選択されていない
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string:"ジャンルを選択しよう", attributes: attributedMessageAttr)
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


    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func saveSong(_ uuid: String) {
        let realSongdata = try? Data(contentsOf: URL(fileURLWithPath: songData.path))
        let realsong = realSongdata!.base64EncodedString(options: [])
        let songDataRef = FIRDatabase.database().reference().child(CommonConst.songData11).child(uuid)
        songDataRef.setValue(realsong) { (error, ref) in
            if (error == nil) {
                // 音源保存完了
                // 次に画像保存
                self.saveImage(uuid)
                print("saveImage")
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    func saveImage(_ uuid: String) {
        // 画像保存
        let size = CGSize(width: 1242, height: 828)
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = UIImageJPEGRepresentation(resizeImage!, 0.5)
        let postData3 = ["image": imageData!.base64EncodedString(options: .lineLength64Characters)];
        let postRef3 = FIRDatabase.database().reference().child(CommonConst.image11).child(genre).child(uuid)
        postRef3.setValue(postData3) { (error, ref) in
            if (error == nil) {
                // 画像保存完了
                // 次に投稿保存
                self.savePost(uuid)
                print("savePost")
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    func savePost(_ uuid: String) {
        // 投稿
        let songName = songname
        let kazu = byou
        let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)! as NSString
        let time = Date.timeIntervalSinceReferenceDate
        let original:NSString = (self.original as NSString?)!
        let cover:NSString = (self.cover as NSString?)!
        let postData = ["time":time,"byou": kazu!, "songname": songName!, "ongen": uuid,"original":original,"cover":cover, "uid":uid] as [String : Any]
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH11).child(genre).child(uuid)
        
        postRef.setValue(postData) { (error, ref) in
            if (error == nil) {
                SVProgressHUD.dismiss()
                self.view.window!.rootViewController!.dismiss(animated: false, completion: nil)
            } else {
                self.showErrorAlert()
            }
        }
    }
    
    
    
    
    func showErrorAlert() {
        SVProgressHUD.dismiss()
        let alert = UIAlertController()
        alert.title = "保存エラー"
        alert.message = "保存エラーが発生しました。ネットワークの状態を確認して再度投稿ボタンを押してください"
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    //セクションのタイトルを返す.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllItems[section].count
    }
    
    
    
}

    



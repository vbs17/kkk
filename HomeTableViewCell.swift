

import UIKit
import AVFoundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


class HomeTableViewCell: UITableViewCell {
    
    var tap:Data?
    weak var playSong: AVAudioPlayer!
    var edittingFlag : Bool = false
    


    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var onlabel2: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var nami: UIProgressView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var hyouka: UIButton!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    @IBOutlet weak var go: UIButton!
    
    //星の色　ここはシンプル 黄色
    func updateStar(_ ratingStr:Int) {
        switch  ratingStr {
        case 0:
            star1.setImage(UIImage(named:"sister7"), for: UIControlState())
            star2.setImage(UIImage(named:"sister7"), for: UIControlState())
            star3.setImage(UIImage(named:"sister7"), for: UIControlState())
            star4.setImage(UIImage(named:"sister7"), for: UIControlState())
            star5.setImage(UIImage(named:"sister7"), for: UIControlState())
        case 1:
            star1.setImage(UIImage(named:"sister13"), for: UIControlState())
            star2.setImage(UIImage(named:"sister7"), for: UIControlState())
            star3.setImage(UIImage(named:"sister7"), for: UIControlState())
            star4.setImage(UIImage(named:"sister7"), for: UIControlState())
            star5.setImage(UIImage(named:"sister7"), for: UIControlState())
            
        case 2:
            star1.setImage(UIImage(named:"sister13"), for: UIControlState())
            star2.setImage(UIImage(named:"sister13"), for: UIControlState())
            star3.setImage(UIImage(named:"sister7"), for: UIControlState())
            star4.setImage(UIImage(named:"sister7"), for: UIControlState())
            star5.setImage(UIImage(named:"sister7"), for: UIControlState())

        case 3:
            star1.setImage(UIImage(named:"sister13"), for: UIControlState())
            star2.setImage(UIImage(named:"sister13"), for: UIControlState())
            star3.setImage(UIImage(named:"sister13"), for: UIControlState())
            star4.setImage(UIImage(named:"sister7"), for: UIControlState())
            star5.setImage(UIImage(named:"sister7"), for: UIControlState())
            
        case 4:
            star1.setImage(UIImage(named:"sister13"), for: UIControlState())
            star2.setImage(UIImage(named:"sister13"), for: UIControlState())
            star3.setImage(UIImage(named:"sister13"), for: UIControlState())
            star4.setImage(UIImage(named:"sister13"), for: UIControlState())
            star5.setImage(UIImage(named:"sister7"), for: UIControlState())

        case 5:
            star1.setImage(UIImage(named:"sister13"), for: UIControlState())
            star2.setImage(UIImage(named:"sister13"), for: UIControlState())
            star3.setImage(UIImage(named:"sister13"), for: UIControlState())
            star4.setImage(UIImage(named:"sister13"), for: UIControlState())
            star5.setImage(UIImage(named:"sister13"), for: UIControlState())
        default: break
        }
    }
    
    
    //二人目も
    //starDic[0] => "bbb"
    //starDic[1] => “3"ってこと？//はいそうです。
    //平均値を取得して反映させる  あれよ大事なあれこれでみんなにデータが配られるわけよこれが原点よ
    func setPostData(_ postData: PostData) {
        if ( postData.cover == "C" && postData.original == "" ) {
            label.backgroundColor = UIColor(red:1.0, green:1.0, blue:0.8, alpha:1.0)
        }
        else if ( postData.cover == "" && postData.original == "O" ) {
            label.backgroundColor = UIColor(red:0.4, green:0.0, blue:0.1, alpha:1.0)


        }
        let stars = postData.star
        
        var average: Int = 0
        
        if stars.count > 0 {
            // 評価の合計
            var sum = 0              //["UID" : "星の数"]
            for data in stars as Array<[String: String]> {
                let starDic = Array(data.keys)
                //starDic[0]はuidで[1]は星の数
                let uid = starDic[0]
                let ratingStr = data[uid]! as String
                if let rating = Int(ratingStr) {
                    sum += rating
                }
                
                
            }
            average = Int(ceil(Double(sum) / Double(stars.count)))
            print("合計:\(sum), 投票数:\(stars.count), 平均値:\(average)")
        }
        
        updateStar(average)
        
        label.text = postData.name
        label2.text = postData.byou
    }
    
    func setPostData1(_ postData: PostData) {
        let stars = postData.star
        
        var average: Int = 0
        
        if stars.count > 0 {
            // 評価の合計
            var sum = 0              //["UID" : "星の数"]
            for data in stars as Array<[String: String]> {
                let starDic = Array(data.keys)
                //starDic[0]はuidで[1]は星の数
                let uid = starDic[0]
                let ratingStr = data[uid]! as String
                if let rating = Int(ratingStr) {
                    sum += rating
                }
                
                
            }
            average = Int(ceil(Double(sum) / Double(stars.count)))
            print("合計:\(sum), 投票数:\(stars.count), 平均値:\(average)")
        }
        
        updateStar(average)
        
    }

    
    //見た目しかやってない
    override func awakeFromNib() {
        super.awakeFromNib()
        nami.transform = CGAffineTransform(scaleX: 1.0, y: 30.0)
        nami.progressImage = UIImage(named: "mmm" )
        nami.trackImage = UIImage(named: "ppp")
        nami.progress = 0
        onlabel2.text = "0:00"
        backButton.layer.cornerRadius = 5
        backButton.clipsToBounds = true
        backButton.isEnabled = false
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.black.cgColor
        imageView1.layer.cornerRadius = 22.2
        imageView1.clipsToBounds = true
        imageView1.layer.borderWidth = 1
        imageView1.layer.borderColor = UIColor.black.cgColor
        hyouka.layer.cornerRadius = 7
        hyouka.clipsToBounds = true
        hyouka.layer.borderWidth = 1
        hyouka.layer.borderColor = UIColor.black.cgColor

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((event?.touches(for: nami)) != nil) {
            print("touchesBegan ---- AudioView")
            let touch = touches.first
            let tapLocation = touch!.location(in: self.view)
            print("touchesBegan ---- " + (tapLocation.x - nami.frame.origin.x).description)
        }
    }
    
    //タッチしたまま指を移動
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((event?.touches(for: nami)) != nil) {
            print("touchesMoved ---- AudioView")
            let touch = touches.first
            let tapLocation = touch!.location(in: self.view)
            print("touchesMoved ---- " + (tapLocation.x - nami.frame.origin.x).description)
            
        }
    }
    
    //タッチした指が画面から離れる
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((event?.touches(for: nami)) != nil) {
            print("touchesEnded ---- AudioView")
            let touch = touches.first
            let tapLocation = touch!.location(in: self.view)
            let x:Double = Double(tapLocation.x - view.frame.origin.x)
            if playSong != nil {
                let time = playSong.duration
                let p:Double = x / Double(nami.frame.size.width)
                playSong.currentTime = Double(time * p)
            }
        }
    }

    
       
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


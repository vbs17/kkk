

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD
import ReachabilitySwift


class Kind22ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, Syugo11TableViewCellDelegate  {
    
    let AllItems: [[String]]  = [[ "alt-j",
                                   "あがた森魚",
                                   "浅井健一",
                                   "安室奈美恵",
                                   "あぶらだこ",
                                   "阿部真央",
                                   "あゆみくりかまき",
                                   "AA=",
                                   "ACIDMAN",
                                   "A Hundred Birds",
                                   "AI",
                                   "AK-69",
                                   "Aldious",
                                   "THE ALFEE",
                                   "Alexandros",
                                   "andymori",
                                   "androp",
                                   "ARIA ASIA",
                                   "ASIAN KUNG-FU GENERATION",
                                   "ASPARAGUS",
                                   "ASA-CHANG&巡礼",
                                   "audio active",
                                   "avengers in sci-fi",
                                   "Azami"],
                                 ["ボアダムス",
                                  "Base Ball Bear",
                                  "back number",
                                  "THE BAWDIES",
                                  "BACK DROP BOMB",
                                  "BABYMETAL",
                                  "THE BACK HORN",
                                  "DJ BAKU",
                                  "the band apart",
                                  "BEAT CRUSADERS",
                                  "BEGIN",
                                  "The Birthday",
                                  "BIGMAMA",
                                  "THA BLUE HERB",
                                  "THE BLUE HEARTS",
                                  "bloodthirsty butchers",
                                  "BLANKEY JET CITY",
                                  "BLUE ENCOUNT",
                                  "BOØWY",
                                  "BOOM BOOM SATELLITES",
                                  "BRAHMAN",
                                  "BUCK-TICK",
                                  "BUMP OF CHICKEN",
                                  "Buffalo Daughter",
                                  "BUZZ THE BEARS",
                                  "B'z"
        ],
                                 ["cero",
                                  "CHEMISTRY",
                                  "CHAGE&ASKA",
                                  "THE CHECKERS",
                                  "CHARA",
                                  "chay",
                                  "Char",
                                  "CINEMA dub MONKS",
                                  "THE CORNELIUS GROUP",
                                  "coldrain",
                                  "CORNELIUS",
                                  "Crossfaith"],
                                 ["怒髪天",
                                  "電気グルーヴ",
                                  "電撃ネットワーク",
                                  "でんぱ組.inc",
                                  "Def Tech",
                                  "DEEN",
                                  "DE DE MOUSE",
                                  "Dizzy Sunfist",
                                  "DMBQ",
                                  "Downy",
                                  "DOPING PANDA",
                                  "DOBERMAN",
                                  "DREAMS COME TRUE",
                                  "Dragon Ash",
                                  "DRY&HEAVY",
                                  "dustbox",
                                  "DUBSENSEMANIA"],
                                 ["エレファントカシマシ",
                                  "eastern youth",
                                  "ELLEGARDEN",
                                  "envy",
                                  "EGO-WRAPPIN",
                                  "EYE"],
                                 ["Fantastic Plastic Machine",
                                  "FACT",
                                  "FAKY",
                                  "Fear, and Loathing in Las Vegas",
                                  "FIRE BALL",
                                  "flumpool",
                                  "Flower Travellin' Band",
                                  "FRONT LINE",
                                  "FRONTIER BACKYARD",
                                  "FUNKY MONKEY BABYS"],
                                 ["ギターウルフ",
                                  "グッドモーニングアメリカ",
                                  "グループ魂",
                                  "ゲスの極み乙女。",
                                  "ゴスペラーズ",
                                  "ゴールデンボンバー",
                                  "郷ひろみ",
                                  "ゴンチチ",
                                  "GACKT",
                                  "GARLIC BOYS",
                                  "the GazettE",
                                  "GANGA ZUMBA",
                                  "GARDEN",
                                  "GLAY",
                                  "GLIM SPANKY",
                                  "THE GOLDEN WET FINGERS",
                                  "GO!GO!7188",
                                  "GReeeeN",
                                  "GRAPEVINE"],
                                 ["ハナレグミ",
                                  "ハスキング・ビー",
                                  "浜田省吾",
                                  "浜田麻里",
                                  "原田郁子",
                                  "畠山美由紀",
                                  "ハジ",
                                  "早川義夫",
                                  "ヒートウェイヴ",
                                  "髭（HiGE）",
                                  "ヒカシュー",
                                  "平井堅",
                                  "氷室京介",
                                  "フレデリック",
                                  "フジファブリック",
                                  "風味堂",
                                  "藤原基央",
                                  "福山雅治",
                                  "フィッシュマンズ",
                                  "フリクション",
                                  "フラワーカンパニーズ",
                                  "ホフディラン",
                                  "布袋寅泰",
                                  "細野晴臣",
                                  "星野源",
                                  "Hawaiian6",
                                  "HARUHI",
                                  "hilcrhyme",
                                  "THE HIGH-LOWS",
                                  "HIM",
                                  "HIROMI THE TRIO PROJECT",
                                  "HIFANA",
                                  "the HIATUS",
                                  "Hi-STANDARD",
                                  "HUSKING BEE",
                                  "HY",
                                  "HYDE"],
                                 ["いきものがかり",
                                  "忌野清志郎",
                                  "井上陽水",
                                  "石野卓球",
                                  "伊藤ふみお",
                                  "稲葉浩志",
                                  "iLL ",
                                  "illion",
                                  "indigo la end"],
                                 ["JUDY AND MARY",
                                  "JUDE",
                                  "JUN SKY WALKER(S)",
                                  ],
                                 ["加藤登紀子",
                                  "勝手にしやがれ",
                                  "かりゆし58",
                                  "完熟トリオ",
                                  "加藤ミリヤ",
                                  "川本真琴",
                                  "カジヒデキ",
                                  "氣志團",
                                  "キセル",
                                  "きゃりーぱみゅぱみゅ",
                                  "キュウソネコカミ",
                                  "キートーク",
                                  "清木場俊介",
                                  "筋肉少女帯",
                                  "木村カエラ",
                                  "ザ・キング・トーンズ",
                                  "くるり",
                                  "桑田佳祐",
                                  "クラムボン",
                                  "クレイジーケンバンド",
                                  "クリープハイプ",
                                  "クチロロ",
                                  "ケツメイシ",
                                  "ケン・イシイ",
                                  "毛皮のマリーズ",
                                  "コブクロ",
                                  "小泉今日子",
                                  "近藤房之助",
                                  "小島",
                                  "コトリンゴ",
                                  "KANA-BOON",
                                  "Kemuri",
                                  "KEYTALK",
                                  "KEN YOKOYAMA",
                                  "Dj KENTARO",
                                  "KIMONOS",
                                  "KNOCK OUT MONKEY",
                                  "KREVA　",
                                  "DJ KRUSH",
                                  "Kylee"
        ],
                                 ["L'Arc~en~Ciel",
                                  "lecca",
                                  "LiSA",
                                  "LITTLE TEMPO",
                                  "LITTLE CREATURES",
                                  "LILI LIMIT",
                                  "LOVE PSYCHEDELICO",
                                  "LOW IQ 01",
                                  "LOSALIOS",
                                  "LOVE JETS"],
                                 ["槇原敬之",
                                  "真心ブラザーズ",
                                  "マキシマムザホルモン",
                                  "三浦大知",
                                  "ミドリ",
                                  "ミラーズ",
                                  "雅-MIYAVI-",
                                  "ムーンライダーズ",
                                  "元ちとせ",
                                  "森山直太朗",
                                  "ももいろクローバーZ",
                                  "森高千里",
                                  "MAN WITH A MISSION",
                                  "THE MAD CAPSULE MARKETS",
                                  "MEG",
                                  "m-flo",
                                  "MiChi",
                                  "Missile Girl Scoot",
                                  "miwa",
                                  "Michael Kaneko",
                                  "MONGOL800",
                                  "MO'SOME TONEBENDER",
                                  "MONORAL",
                                  "MONO",
                                  "MONOEYES",
                                  "THE MODS",
                                  "MONKEY MAJIK",
                                  "Mr.Children",
                                  "MUDDY APES",
                                  "MURO"
        ],
                                 ["ナオト・インティライミ",
                                  "長渕剛",
                                  "中田ヤスタカ",
                                  "中山うり",
                                  "夏木マリ",
                                  "七尾旅人",
                                  "ナンバーガール",
                                  "西川貴教",
                                  "ねごと",
                                  " NICO Touches the Walls",
                                  "NITRO MICROPHONE UNDERGROUND"],
                                 ["大沢伸一",
                                  "大橋トリオ",
                                  "大森靖子",
                                  "大江慎也",
                                  "岡崎体育",
                                  "岡林信康",
                                  "岡村靖幸",
                                  "奥田民生",
                                  "尾崎豊",
                                  "押尾コータロー",
                                  "小田和正",
                                  "小野リサ",
                                  "オフコース",
                                  "オルケスタ・デ・ラ・ルス",
                                  "OKAMOTO'S",
                                  "oh sunshine",
                                  "ONE☆DRAFT",
                                  "ONE OK ROCK",
                                  "OOIOO",
                                  "THE ORAL CIGARETTES",
                                  "ORANGE RANGE",
                                  "OVERGROUND ACOUSTIC UNDERGROUND",
                                  "OZROSAURUS"
        ],
                                 ["プリンセス・プリンセス",
                                  "ポルノグラフィティ",
                                  "プレイモ",
                                  "Pay money To my Pain",
                                  "PE'Z",
                                  "Perfume",
                                  "PEALOUT",
                                  "the pillows",
                                  "POLYSICS",
                                  "PONTIACS",
                                  "PUFFY"
        ],
                                 ["羅針盤",
                                  "凛として時雨",
                                  "ルースターズ",
                                  "レイ・ハラカミ",
                                  "レミオロメン",
                                  "RADWIMPS",
                                  "RHYMESTER",
                                  "RIRI",
                                  "RIZE",
                                  "RIP SLYME",
                                  "ROVO",
                                  "ROSSO",
                                  "RYUKYUDISKO"
        ],
                                 ["サカナクション",
                                  "斉藤和義",
                                  "サザンオールスターズ",
                                  "サイケアウツ",
                                  "桜井和寿",
                                  "サンハウス",
                                  "サンディー",
                                  "サニーデイ・サービス",
                                  "椎名林檎",
                                  "清水翔太",
                                  "シーナ&ロケッツ",
                                  "渋さ知らズ",
                                  "シド",
                                  "シャ乱Q",
                                  "少年ナイフ",
                                  "湘南乃風",
                                  "スキマスイッチ",
                                  "スカフレイムス",
                                  "スガシカオ",
                                  "スピッツ",
                                  "スカフレイムス",
                                  "水曜日のカンパネラ",
                                  "スチャダラパー",
                                  "砂原良徳",
                                  "ステレオポニー",
                                  "セツナブルースター",
                                  "ソウル・フラワー・ユニオン",
                                  "曽我部恵一",
                                  "ソナーポケット",
                                  "相対性理論",
                                  "SALTY DOG",
                                  "SANABAGUN.",
                                  "SAKEROCK",
                                  "SCANDAL",
                                  "SEKAI NO OWARI",
                                  "SHERBETS",
                                  "SHISHAMO",
                                  "Shing02",
                                  "SKA SKA CLUB",
                                  "SNAIL RAMP",
                                  "SUGIURUMN",
                                  "SUPERCAR",
                                  "SION",
                                  "The Sketchbook",
                                  "SOIL& PIMP SESSIONS",
                                  "Spangle call lilli line",
                                  "SpecialThanks",
                                  "SPECIAL OTHERS",
                                  "SQUARE",
                                  "SUPER BUTTER DOG",
                                  "Superfly",
                                  "Sunrise In My Attache Case",
                                  "Super Junky Monkey",
                                  "SWANKY DANK"
        ],
                                 ["高田漣",
                                  "高橋優",
                                  "高橋幸宏",
                                  "田中フミヤ",
                                  "谷村奈南",
                                  "玉置浩二",
                                  "チャットモンチー",
                                  "つじあやの",
                                  "つんく♂",
                                  "土屋アンナ",
                                  "テイ・トウワ",
                                  "トクマルシューゴ",
                                  "トータス松本",
                                  "豊田勇造",
                                  "東京スカパラダイスオーケストラ",
                                  "東京事変",
                                  "東京カランコロン",
                                  "徳永英明",
                                  "TERIYAKI BOYZ",
                                  "the telephones",
                                  "thee michelle gun elephant",
                                  "TMG",
                                  "T.M.Revolution",
                                  "TOKYO No.1 SOUL SET",
                                  "Tommy heavenly6",
                                  "toe",
                                  "TOTALFAT",
                                  "TRICERATOPS",
                                  "TUXEDO",
                                  "TUBE",
                                  "TWIGY"],
                                 ["上原ひろみ",
                                  "宇多田ヒカル",
                                  "ウルフルズ",
                                  "UA",
                                  "UVERworld"
        ],
                                 ["VOLA & THE ORIENTAL MACHINE"
        ],
                                 ["忘れらんねぇよ",
                                  "ワタナベイビー",
                                  "和田アキ子",
                                  "WANDS",
                                  "WAGDUG FUTURISTIC UNITY",
                                  "WEAVER",
                                  "WHITE ASH",
                                  "The Winking Owl"],
                                 ["Xmas Eileen"
        ],
                                 ["矢沢永吉",
                                  "山崎まさよし",
                                  "山下洋輔",
                                  "山内恵介",
                                  "山下智久",
                                  "柳ジョージ&レイニーウッド",
                                  "矢野顕子",
                                  "やけのはら",
                                  "ゆらゆら帝国",
                                  "湯川潮音",
                                  "ゆず",
                                  "ユニコーン",
                                  "四人囃子",
                                  "吉井和哉",
                                  "吉田拓郎",
                                  "米津玄師",
                                  "ヨーコ・オノ・プラスチック・オノ・バンド",
                                  "yanokami",
                                  "Yellow Magic Orchestra",
                                  "THE YELLOW MONKEY",
                                  "YOUR SONG IS GOOD",
                                  "YUKI",
                                  "YUI "
        ],
                                 ["在日ファンク",
                                  "頭脳警察",
                                  "ZAZEN BOYS",
                                  "ZONE"],
                                 ["80kidz",
                                  "9mm Parabellum Bullet"]]
    
    fileprivate let mySections: NSArray = ["A", "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","R","S","T","U","V","W","X","Y","Z","number"]
    
    var hiniti:String!
    var zikoku:String!
    var station:String!
    var path:String!
    var image:UIImage!
    var genre = ""
    var tappedCellPos:IndexPath! //タップされたCellのindexPath
    var buttonOriginalColor:UIColor!//ボタンの元の色
    var isRowSelected:Bool = false//現在行が選択状態か否か
    
    
    @IBAction func yougo(_ sender: Any) {
    }
    @IBAction func hougo(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        tappedCellPos = nil
        genre = ""
        isRowSelected = false
        tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Syugo11TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cellss")
        tappedCellPos = nil
    }
    
    func buttonPressed(_ tableViewCell: Syugo11TableViewCell) {
        let indexPath = tableView.indexPath(for: tableViewCell)
        // 初めてのタップ
        if tappedCellPos == nil {
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.kete.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.kete.backgroundColor = UIColor.green
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
                tableViewCell.kete.backgroundColor = buttonOriginalColor
                // ジャンルを未選択（空文字）に
                genre = ""
                // 行が非選択状態とする
                isRowSelected = false
                // タップされたセルのindexPathを保存
                tappedCellPos = indexPath
            } else {
                // 行が非選択の状態なら、選択状態にする
                // オリジナルのボタンの色を取得
                buttonOriginalColor = tableViewCell.kete.backgroundColor!
                // ボタンの色を緑に。
                tableViewCell.kete.backgroundColor = UIColor.green
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
                    let oldCell:Syugo11TableViewCell = tableView.cellForRow(at: tappedCellPos) as! Syugo11TableViewCell
                    oldCell.kete.backgroundColor = buttonOriginalColor;
                    
                }
            }            // 今回選択された行を選択状態とする
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.kete.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.kete.backgroundColor = UIColor.green
            // ジャンルを決定
            genre = AllItems[indexPath!.section][indexPath!.row]
            // 行が選択されている
            isRowSelected = true
            // タップされたセルのindexPathを保存
            tappedCellPos = indexPath
        }
        
    }
    func saveImage(uuid: String) {
        // 画像保存
        let size = CGSize(width: 1242, height: 828)
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = UIImageJPEGRepresentation(resizeImage!, 0.5)
        let postData4 = ["image": imageData!.base64EncodedString(options: .lineLength64Characters)];
        let postRef = FIRDatabase.database().reference().child(CommonConst.image22).child(genre).child(uuid)
        postRef.setValue(postData4) { (error, ref) in
            if (error == nil) {
                // 画像保存完了
                // 次に投稿保存
                self.savePost(uuid: uuid)
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    
    func savePost(uuid: String) {
        // 投稿
        let hiniti1 = hiniti
        let zikoku1 = zikoku
        let path1 = path
        let station1 = station
        let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)! as NSString
        let time = NSDate.timeIntervalSinceReferenceDate
        let postData1 = ["time":time,"hiniti": hiniti1,"zikoku": zikoku1, "station": station1, "path":path1,"uid":uid] as [String : Any]
        
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH22).child(genre).child(uuid)
        
        postRef.setValue(postData1) { (error, ref) in
            if (error == nil) {
                // 画像保存完了
                SVProgressHUD.dismiss()
                // 先頭に戻る
                self.view.window!.rootViewController!.dismiss(animated: false, completion: nil)
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    func showErrorAlert() {
        SVProgressHUD.dismiss()
        let alert = UIAlertController()
        alert.title = "保存エラー"
        alert.message = "保存エラーが発生しました。ネットワークの状態を確認して再度保存ボタンを押してください"
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func post(_ sender: Any) { if isRowSelected {
        let reachability = Reachability()!
        if reachability.isReachable {
        let image = UUID().uuidString
        saveImage(uuid: image)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.show()
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
        
    }  else {
        // 行が選択されていない＝ジャンルが選択されていない
        let alert = UIAlertController()
        let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
        let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
        alert.setValue(attributedTitle, forKey: "attributedTitle")
        let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
        let attributedMessage = NSAttributedString(string: "ジャンルを選択しよう", attributes: attributedMessageAttr)
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
    
    
    //値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellss", for: indexPath) as! Syugo11TableViewCell
        cell.delegate = self
        //ここ
        cell.kete.backgroundColor = UIColor.lightGray
        if (tappedCellPos != nil){
            if (tappedCellPos == indexPath){
                cell.kete.backgroundColor = UIColor.green
            }
        }
        let items = AllItems[indexPath.section][indexPath.row]
        cell.label.text = items
        return cell
    }

    
    
    //Cellが選択された際に呼び出される.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //セクションの数を返す.
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    //セクションのタイトルを返す.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllItems[section].count
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

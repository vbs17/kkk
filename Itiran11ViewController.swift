

import UIKit
import ReachabilitySwift

class Itiran11ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func bacl(_ sender: Any) {
     self.view.window!.rootViewController!.dismiss(animated: false, completion: nil)
    }
        fileprivate let mySections: NSArray = ["A", "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","R","S","T","U","V","W","X","Y","Z","number"]
    let AllItems: [[String]]  = [[ "ABBA",
                                   "Aaron Neville",
       "ABBA",
        "ABC",
        "ACDC",
        "Adam Lambert",
        "Adele",
        "Aerosmith",
        "AFI",
        "A HA",
        "Aimee Mann",
        "Air Supply",
        "Alanis Morissette",
        "Albert Hammond Jr",
        "Albert King",
        "Album Leaf",
        "Alec Empire",
        "Alice In Chains",
        "Alicia Keys",
        "Al Koope",
        "ALLiSTER",
        "Allman Brothers Band",
        "All Saints",
        "Andrew W K",
        "Ani Difranco",
        "Anne Dorte Michelsen",
        "Anne Murray",
        "Antonio Carlos Jobim",
        "A Perfect Circle",
        "Apples In Stereo",
        "Aqualung",
        "Arabesque",
        "Arab Strap",
        "Arcade Fire",
        "Arch Enemy",
        "Arctic Monkeys",
        "THE ARTIST FORMARLY KNOWN AS PRINCE",
        "Art Of Noise",
        "A S A P",
        "Ash",
        "Asia",
        "Astor Piazzolla",
        "A Teens",
        "Atomic Kitten",
        "Audioslave",
        "Auteurs",
        "Avril Lavigne",
        "Aztec Camera"

                                   ],
                                 ["B52 s",
                                    "Babyshambles",
                                    "Badfinger",
                                    "Badly Drawn Boy",
                                    "BAD MANNERS",
                                    "Bad Religion",
                                    "Bananarama",
                                    "The Band",
                                    "Band Aid",
                                    "The Bangles",
                                    "Barry White",
                                    "Basia",
                                    "Battles",
                                    "Bay City Rollers",
                                    "B.B. King",
                                    "Beach Boys",
                                    "Beady Eye",
                                    "Beastie Boys",
                                    "The Beatles",
                                    "Beck",
                                    "Bee Gees",
                                    "Belinda Carlisle",
                                    "BELLE AND SEBASTIAN",
                                    "Ben E.King",
                                    "Ben Folds Five",
                                    "Ben Harper",
                                    "Ben Lee",
                                    "Benny Sings",
                                    "Bent Fabric",
                                    "Ben Watt",
                                    "Ben Westbeech",
                                    "Bernard Butler",
                                    "The Beta Band",
                                    "Beth Orton",
                                    "Bette Midler",
                                    "Billy Idol",
                                    "Billy Joel",
                                    "Bing Crosby",
                                    "BiS",
                                    "Bjork",
                                    "The Black Crowes",
                                    "The Black Eyed Peas",
                                    "BLACK REBEL MOTORCYCLE CLUB",
                                    "Black Sabbath",
                                    "Blind Faith",
                                    "BLIND GUARDIAN",
                                    "Blind Melon",
                                    "Blink-182",
                                    "Bloc Party",
                                    "Blood Red Shoes",
                                    "The Blues Brothers",
                                    "The Bluetones",
                                    "Blur",
                                    "BMX Bandits",
                                    "Bobby Caldwell",
                                    "Bob Dylan",
                                    "Bob Marley",
                                    "Bob Marley & The Wailers",
                                    "Bombay Bicycle Club",
                                    "Bon Iver",
                                    "Bon Jovi",
                                    "Bonnie ”Prince” Billy",
                                    "Booker T",
                                    "The Boo Radleys",
                                    "Bootsy Collins",
                                    "Boss Hog",
                                    "Boston",
                                    "Boy George",
                                    "Boys Town Gang",
                                    "Boyz II Men",
                                    "Boz Scaggs",
                                    "Brian Eno",
                                    "Brian Harold May",
                                    "Brian Setzer",
                                    "Bright Eyes",
                                    "British Sea Power",
                                    "Britney Spears",
                                    "Broken Social Scene",
                                    "Bruce Springsteen",
                                    "Bruno Mars",
                                    "Bryan Adams",
                                    "Bryan Ferry",
                                    "Buddy Guy",
                                    "Burt Bacharach",
                                    "Bush",
                                    "Busted",
                                    "Butter 08",
                                    "Butthole Surfers",
                                    "Buzzcocks",
                                    "The Byrds"
        ],
                                 [
                                    "Caesars",
                                    "Cajun Dance Party",
                                    "CAKE",
                                    "The Calling",
                                    "CAN",
                                    "Captain Beefheart and His Magic Band",
                                    "Carcass",
                                    "Cardigans",
                                    "Carole King",
                                    "Carole Serrat",
                                    "Carpenters",
                                    "Cars",
                                    "Carter USM",
                                    "Cat Stevens",
                                    "Cecile Corbel",
                                    "Celine Dion",
                                    "Celtic Woman",
                                    "The Charlatans",
                                    "Charlotte Gainsbourg",
                                    "Cheap Trick",
                                    "Chet Atkins",
                                    "Chic",
                                    "Chicago",
                                        "!!!",
                                    "Chris De Burgh",
                                    "Chris Rea",
                                    "Christina Aguilera",
                                    "Christopher Cross",
                                    "Christopher Young",
                                    "Chuck Berry",
                                    "Cinderella",
                                    "CINNAMON",
                                    "Clap Your Hands Say Yeah",
                                    "The Clash",
                                    "Clementine",
                                    "Cloudberry Jam",
                                    "Cocteau Twins",
                                    "Coldplay",
                                    "Collective Soul",
                                    "Commodores",
                                    "Connie Francis",
                                   "Coral",
                                    "Corinne Bailey Rae",
                                    "Cornershop",
                                    "Corrs",
                                    "Courtney Love",
                                    "Coverdale-Page",
                                    "Cowboy Junkies",
                                    "Craig David",
                                    "Cranberries",
                                    "CREAM",
                                    "Cribs",
                                    "CSN and Y",
                                    "CSS",
                                    "The Cult",
                                    "Culture Club",
                                    "Cure",
                                    "Curve",
                                    "Cyndi Lauper"],
                                 ["The Damned",
                                    "Damn Yankees",
                                    "Damon and Naomi",
                                    "Daniel Lanois",
                                    "Daniel Powter",
                                    "Danzig",
                                    "Daryl Hall",
                                    "Daryl Hall & John Oates",
                                    "Dashboard Confessional",
                                    "David Bowie",
                                    "David Gilmour",
                                    "David Sylvian",
                                    "Dead Can Dance",
                                    "Dead Or Alive",
                                    "Death Cab For Cutie",
                                    "Death From Above 1979",
                                    "Death In Vegas",
                                    "Debbie Gibson",
                                    "Deep Purple",
                                    "Deerhoof",
                                    "Depeche Mode",
                                    "Derek and the Dominos",
                                    "Derek Trucks",
                                    "Descendents",
                                    "Des'ree",
                                    "Destiny's Child",
                                    "Devendra Banhart",
                                    "DEVO",
                                    "Diana King",
                                    "Dinosaur Jr",
                                    "Dionne Warwick",
                                    "Dixie Chicks",
                                    "Dodgy",
                                    "Donald Fagen",
                                    "Donavon Frankenreiter",
                                    "Donots",
                                    "Donovan",
                                    "The Doobie Brothers",
                                    "The Doors",
                                    "Dr. Feelgood",
                                    "Dr. John",
                                    "Dropkick Murphys",
                                    "Duane Allman",
                                    "Duran Duran"
],
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
                                  
                                  "SION",
                                  "The Sketchbook",
                                  "SOIL& PIMP SESSIONS",
                                  "Spangle call lilli line",
                                  "SpecialThanks",
                                  "SPECIAL OTHERS",
                                  "SQUARE",
                                  "Suchmos",
                                  "SUPER BUTTER DOG",
                                  "SUGIURUMN",
                                  "SUPERCAR",
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
    
    var genre:String!
    
    @IBOutlet weak var you: UIButton!
    @IBOutlet weak var hou: UIButton!
        @IBAction func hougo(_ sender: Any) {
            self.dismiss(animated: false, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Itiran1TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cellll")
        you.isEnabled = false


    }
    
    //Cellが選択された際に呼び出される.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reachability = Reachability()!
        if reachability.isReachable {
            let homeviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Home11") as! Home11ViewController
            genre =  AllItems[indexPath.section][indexPath.row]
            homeviewcontroller.genre = genre
            self.present(homeviewcontroller, animated: true, completion: nil)
            
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
        
        
    }
    
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllItems[section].count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellll", for: indexPath) as! Itiran1TableViewCell
        let items = AllItems[indexPath.section][indexPath.row]
        cell.label.text = items
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    
    //セクションのタイトルを返す.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentsOffsetYFloat:Float = Float(self.tableView.contentOffset.y)
        let diffFloat:Float = Float(self.tableView.contentSize.height - self.tableView.bounds.size.height)
        let contentsOffsetY:NSDecimalNumber = NSDecimalNumber(value: contentsOffsetYFloat)
        let diff:NSDecimalNumber = NSDecimalNumber(value: diffFloat)
        if(contentsOffsetY.subtracting(diff)==0)
        {
            
            print("scrolling to bottom")
            
        }
        
    }

    
    
}

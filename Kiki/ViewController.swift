import UIKit
import AVFoundation


//録音できたものを次の画面に移す　録音中にマイクの音を拾って波をつける

class ViewController: UIViewController,AVAudioRecorderDelegate {
    
    
    let fileManager = FileManager()//録音もできないしそれを再生もできない
    var audioRecorder: AVAudioRecorder!
    let fileName = "sister.m4a"
    var timer: Timer!
    var timeCountTimer: Timer!
    let photos = ["55","56","57","58","59","0004"]
    var count = 1
    var timeCount = 1
    var count1: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var recordImage: UIButton?
    @IBOutlet weak var nami1: UIProgressView!
    @IBOutlet weak var nami2: UIProgressView!
    @IBOutlet weak var nami3: UIProgressView!
    @IBOutlet weak var byou: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupAudioRecorder()
        recordImage!.layer.cornerRadius = recordImage!.frame.size.width / 2
        recordImage!.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)//受信者のディスパッチ(タスク(処理の実行単位)を実際に計算処理させるためにCPU(装置)を割り当てる)表に項目を追加します
        NotificationCenter.default.addObserver(
            self,
            //受信者に送信するメッセージを指定するセレクタ
            //アプリケーションがフォアグラウンドからバックグラウンドに実行されたときや着信通知に応答するときなど、状態遷移に応答します
            selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
            //この名前の通知のみがオブザーバに配信されます。
            //他のオブジェクトにブロードキャストできるように情報をカプセル化
            //通知の名前に使用される型。
            //通知名はネストされたNSNotification.Name型を使用
            //アプリがアクティブでなくなってフォーカスが失われたときに通知されます。
            //通知 = selectorで指定した関数が呼ばれる
            name:NSNotification.Name.UIApplicationWillResignActive,
            //オブザーバが受信したい通知を持つオブジェクト。 つまり、この送信者によって送信された通知のみがオブザーバに配信されます。
            object: nil
        )
        byou.text = "0:00"
        imageView.image = UIImage(named: "11114")
        recordImage?.setImage(nil, for: .normal)
        recordImage?.setBackgroundImage(UIImage(named: "kesiki"), for: .normal)
        
        nami1.progress = 1
        nami2.progress = 1
        nami3.progress = 1
        count = 1
        timeCount = 1
        count1 = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //音源消す 最終確認　　　　　　　　　　　　//通知は、NotificationCenterを介してオブザーバにブロードキャストされる情報をカプセル化(隠蔽)します。
    func applicationWillResignActive(_ notification: Notification) {
        print("applicationWillResignActive!")
        if ( audioRecorder.isRecording || count1 == true ) {
            if ( self.timer != nil) {
                self.timer.invalidate()
            }
            if ( self.timeCountTimer != nil) {
                self.timeCountTimer.invalidate()
            }
            audioRecorder.stop()
            NotificationCenter.default.removeObserver(self)
            let playviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syuru")
            self.present(playviewcontroller!, animated: true, completion: nil)
        }
    }
    
    
    
    func levelTimerCallback() {
        audioRecorder.updateMeters()
        let dB = audioRecorder.averagePower(forChannel: 0)
        let atai = max(0, (dB + 77)) / 77
        nami1.progress = atai
        nami2.progress = atai
        nami3.progress = atai
    }
    
    //filenameをsongDataに渡す
    func nextGamenn(){
        let playviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Play") as! PlayViewController
        playviewcontroller.songData = self.documentFilePath()
        self.present(playviewcontroller, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func recordStart(_ sender: UIButton) {
        if count == 1{
            count1 = true
            recordImage!.isEnabled = false
            let image:UIImage! = UIImage(named: photos[0])
            imageView.image = image
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.nextPage), userInfo: nil, repeats: true )
        }else if count == 5{
            self.timeCountTimer.invalidate()
            self.timer.invalidate()
            audioRecorder.stop()
            nextGamenn()
        }
    }
    
    
    func nextPage (_ sender:Timer){
        
        var image:UIImage! = UIImage(named: photos[1])
        if count == 1{
            count1 = true
            imageView.image = image;
            count += 1
        }else if count == 2{
            count1 = true
            image = UIImage(named: photos[2])
            imageView.image = image
            count += 1
        }else if count == 3{
            count1 = true
            image = UIImage(named: photos[3])
            imageView.image = image
            count += 1
        }else if count == 4{
            count1 = true
            image = UIImage(named: photos[4])
            imageView.image = image
            count += 1
        }else if count == 5{
            count1 = true
            image = UIImage(named: photos[5])
            imageView.image = image
            sender.invalidate()
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            self.timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(ViewController.levelTimerCallback), userInfo: nil, repeats: true)
            self.timeCountTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.recordLimits), userInfo: nil, repeats: true)
            audioRecorder.isMeteringEnabled = true
            recordImage!.setImage(UIImage(named: "Kiki28"), for: UIControlState())
            recordImage!.layer.cornerRadius = 37
            recordImage!.clipsToBounds = true
            recordImage!.isEnabled = true
            
        }
        
    }
    
    //マイクから取りこんだ音声データを、再生専用とか録音専用の指定もある
    func setupAudioRecorder() {
        //音を録音したりする一連の操作や通信 //1つ！
        let session = AVAudioSession.sharedInstance()
        //音を録音したりする一連の操作や通信のカテゴリを設定 → 録画して再生するアプリケーションに適したカテゴリ
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        //録音を許可
        try! session.setActive(true)
        let recordSetting : [String : AnyObject] = [
            //.m4a 圧縮形式 MPEG-4規格の音声ファイルの拡張子/ e-words.txtならば「txt」が拡張子/拡張子によって、そのファイルを「どのアプリケーションソフトで開くのか」を判断
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
            //1はモノラル 2はステレオ
            AVNumberOfChannelsKey: 1 as AnyObject ,
            //毎秒44100回ページをめくるパラパラ漫画/凄いスピードで1枚1枚ページをめくる様に開いていく事で1つの動画として完成させている
            AVSampleRateKey: 44100 as AnyObject
        ]
        
        do {
            try audioRecorder = AVAudioRecorder(url: self.documentFilePath(), settings: recordSetting)
            
            print(self.documentFilePath())
        } catch {
            print("初期設定でerror")
        }
    }
    
    // 録音するファイルのパスを取得(録音時、再生時に参照)//要求されたドメインで指定された一般的なディレクトリの Url の配列を返します
    func documentFilePath()-> URL {
        //フォルダの詳細はググる→普通に出てくる
        //アプリの領域には初めから以下の3つのフォルダが作成されています。
        //・Documents
        //・Library
        //・tmp
        //そのうちのDocumentsフォルダのパスを取得しているという事です。
        //userDomainMaskはそのアプリの使用できるHome directoryのパスを取得
        //userDomainMaskのパスは以下
        // file : ///Users/sister/Library/Developer/CoreSimulator/Devices/255042D4-3429-4F66-94F4-691559395152/data/Containers/Data/Application/FF57D127-482D-434C-AC1F-028C49819316
        //documentDirectoryのパスはそれ以降の以下を指していると思ってよいのではないでしょうか？
        // /Documents
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask) as [URL]
        let dirURL = urls[0]
        //パスコンポーネントがディレクトリかどうかを判断します。 そうであれば、末尾に/を付加
        return dirURL.appendingPathComponent(fileName)
    }
    
    //%dはフォーマット指定子と呼ばれ、%dの部分に整数を10進(0から9までの数)で出力する場合に使います。このプログラムでは"%d:0%d"の後ろにminuteCountとsecondCountを渡しているため、1つ目の%dにはminuteCountが、2つ目の%dにはsecondCountが代入されます。
    //このプログラムは、秒(secondCount)が9以下の時、すなわち1桁の時は前に0をくっつけて2桁に補正するようにしているみたいですね。
    //12分34秒の場合
    //String(format: "%d:%d", 12, 34) → 12:34
    //12分5秒の場合
    //String(format: "%d:0%d", 12, 5) → 12:05
    //でも"%02d"ってやればわざわざif文でわけなくてもゼロ補正できたような。。。
    func recordLimits(){
        //A / B ――AをBで除算（割り算）します。
        //A % B ――AをBで割った余りを計算します。
        //330/60=5（除算）、330%60=30（剰余）
        let minuteCount = timeCount / 60
        let secondCount = timeCount % 60
        if secondCount <= 9 {
            byou.text = String(format: "%d:0%d", minuteCount, secondCount)
        } else if secondCount >= 10 {
            byou.text = String(format: "%d:%d" , minuteCount, secondCount)
}
        if timeCount == 360{
            self.timeCountTimer.invalidate()
            self.timer.invalidate()
            audioRecorder.stop()
            nextGamenn()
        }else{
            timeCount += 1
}
}
    @IBAction func back(_sender: AnyObject){
        self.timeCountTimer?.invalidate()
        self.timer?.invalidate()
        audioRecorder?.stop()
        self.dismiss(animated: true, completion: nil)
}
}


























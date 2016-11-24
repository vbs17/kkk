



import UIKit
import AVFoundation


//録音できたものを次の画面に移す　録音中にマイクの音を拾って波をつける

class ViewController: UIViewController,AVAudioRecorderDelegate {
    
    
    let fileManager = FileManager()//録音もできないしそれを再生もできない
    var audioRecorder: AVAudioRecorder!
    let fileName = "sister.m4a"
    var timer: Timer!
    var timeCountTimer: Timer!
    let photos = ["Kiki17", "Kiki18", "Kiki19","Kiki20","Kiki21","08531cedbc172968acd38e7fa2bfd2e0"]
    var count = 1
    var timeCount = 1
    let ApplicationDidEnterBackgroundNotification = "ApplicationDidEnterBackgroundNotification"
    var count1: Bool = false


    
   
    
    
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
        super.viewDidDisappear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)),
            name:NSNotification.Name.UIApplicationWillResignActive,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    //音源消す 最終確認
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
        let session = AVAudioSession.sharedInstance()
        
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)        
        
        try! session.setActive(true)
        let recordSetting : [String : AnyObject] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
            AVNumberOfChannelsKey: 1 as AnyObject ,
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
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask) as [URL]
        let dirURL = urls[0]
        return dirURL.appendingPathComponent(fileName)
    }
      func recordLimits(){
        let minuteCount = timeCount / 60
        let secondCount = timeCount % 60
        if secondCount <= 9 {
        byou.text = String(format: "%d:0%d", minuteCount, secondCount)
        }else if secondCount >= 10 {
        byou.text = String(format: "%d:%d", minuteCount, secondCount)
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
   
    @IBAction func back(_ sender: AnyObject) {
        self.timeCountTimer?.invalidate()
        self.timer?.invalidate()
        audioRecorder?.stop()
        let playviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syuru") 
        self.present(playviewcontroller!, animated: true, completion: nil)
        
    }

   
    

        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  }








































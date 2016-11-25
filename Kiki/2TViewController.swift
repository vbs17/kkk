
import UIKit
import AVFoundation
import Accelerate


class _TViewController: UIViewController,AVAudioRecorderDelegate {
    //こいつが音源
    
    var playSong:AVAudioPlayer!
    var timer: Timer!
    var timeCountTimer: Timer!
    let photos = ["Kiki17", "Kiki18", "Kiki19","Kiki20","Kiki21","08531cedbc172968acd38e7fa2bfd2e0"]
    var count = 1
    var timeCount = 1
    var songData:URL!//結合させる
    var audioEngine: AVAudioEngine!
    var player: AVAudioPlayerNode!
    var averagePower:Float32 = 0
    var songFile:URL!
    let mixerMeter = MixerMeter()
    var iyahon:URL!
    let recordSetting : [String : AnyObject] = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
        AVNumberOfChannelsKey: 1 as AnyObject ,
        AVSampleRateKey: 44100 as AnyObject
    ]

    
    @IBOutlet weak var recButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nami1: UIProgressView!
    @IBOutlet weak var nami2: UIProgressView!
    @IBOutlet weak var nami3: UIProgressView!
    @IBOutlet weak var byou: UILabel!
    @IBOutlet weak var recImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recImage!.layer.cornerRadius = 37
        recImage!.clipsToBounds = true
        
    }
    
    /// Audio Session Route Change : ルートが変化した(ヘッドセットが抜き差しされた)
    func audioSessionRouteChanged(_ notification: Notification) {
        let reasonObj = notification.userInfo![AVAudioSessionRouteChangeReasonKey] as! NSNumber
        if let reason = AVAudioSessionRouteChangeReason(rawValue: reasonObj.uintValue) {
            switch reason {
            case .newDeviceAvailable:
                // 新たなデバイスのルートが使用可能になった
                // （ヘッドセットが差し込まれた）
                
                
                break
            case .oldDeviceUnavailable:
                self.timeCountTimer.invalidate()
                self.timer.invalidate()
                audioEngine.mainMixerNode.removeTap(onBus: 0)
                audioEngine.stop()
                let deleteSong = try!AVAudioRecorder(url: iyahon,settings:recordSetting)
                deleteSong.deleteRecording()
                self.dismiss(animated: true, completion: nil)
                break
            default:
                break
            }
        }
    }
    
    //音源消す
    func applicationWillResignActive(_ notification: Notification) {
        print("applicationWillResignActive!")
        if ( self.timer != nil) {
            self.timer.invalidate()
        }
        if ( self.timeCountTimer != nil) {
            self.timeCountTimer.invalidate()
        }
        if ( audioEngine != nil ) {
            if ( audioEngine.isRunning ) {
                audioEngine.mainMixerNode.removeTap(onBus: 0)
                audioEngine.stop()
            }
        }
        NotificationCenter.default.removeObserver(self)
        
       self.dismiss(animated: true, completion: nil)
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
    
    @IBAction func rec(_ sender: AnyObject) {
        if count == 1{
            recButton!.isEnabled = false
            let image:UIImage! = UIImage(named: photos[0])
            imageView.image = image
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(_TViewController.nextPage), userInfo: nil, repeats: true )
        }else if count == 5{
            self.timeCountTimer.invalidate()
            self.timer.invalidate()
            audioEngine.mainMixerNode.removeTap(onBus: 0)
            audioEngine.stop()
            nextGamenn()
        }
    }
    
    func nextGamenn(){
        let playviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Play2") as! Play2ViewController
        playviewcontroller.songData2 = songFile
        self.present(playviewcontroller, animated: true, completion: nil)
    }
    
    
    func nextPage (_ sender:Timer){
        
        var image:UIImage! = UIImage(named: photos[1])
        if count == 1{
            imageView.image = image;
            count += 1
        }else if count == 2{
            image = UIImage(named: photos[2])
            imageView.image = image
            count += 1
        }else if count == 3{
            image = UIImage(named: photos[3])
            imageView.image = image
            count += 1
        }else if count == 4{
            image = UIImage(named: photos[4])
            imageView.image = image
            count += 1
        }else if count == 5{
            image = UIImage(named: photos[5])
            imageView.image = image
            play()
            self.timer.invalidate()
            self.timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(_TViewController.levelTimerCallback), userInfo: nil, repeats: true)
            self.timeCountTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(_TViewController.recordLimits), userInfo: nil, repeats: true)
            sender.invalidate()
            recButton!.setImage(UIImage(named: "Kiki28"), for: UIControlState())
            recButton!.layer.cornerRadius = 37
            recButton!.clipsToBounds = true
            recButton!.isEnabled = true
            
        }
        
    }
    
    
    func play() {
        //ヘッドセットの抜き差しを検出するようにします
    NotificationCenter.default.addObserver(self, selector: #selector(audioSessionRouteChanged(_:)), name: NSNotification.Name.AVAudioSessionRouteChange, object: nil);
        let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let filePath2 = URL(fileURLWithPath: documentDir + "/sample.m4a")
        songFile = filePath2
        if let url = songData {
            do {
                let audioSession = AVAudioSession.sharedInstance()
                try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                try audioSession.setActive(true)
                
                let audioFile = try AVAudioFile(forReading: url)
                
                
                audioEngine = AVAudioEngine()
                mixerMeter.mixer = audioEngine.mainMixerNode
                mixerMeter.setMeteringEnabled(true)
                player = AVAudioPlayerNode()
                audioEngine.attach(player)
                let mixer = audioEngine.mainMixerNode
                
                audioEngine.connect(player, to: mixer, fromBus: 0, toBus: 0, format: player.outputFormat(forBus: 0))
                let inputNode = audioEngine.inputNode!
                let format = AVAudioFormat(commonFormat: .pcmFormatFloat32  , sampleRate: 44100, channels: 1 , interleaved: true)
                audioEngine.connect(inputNode, to: mixer, fromBus: 0, toBus: 1, format: format)
                
                player.scheduleFile(audioFile, at: nil) {
                    print("complete")
                }
                
                let recordSetting : [String : AnyObject] = [
                    AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
                    AVNumberOfChannelsKey: 2 as AnyObject ,
                    AVSampleRateKey: 44100 as AnyObject
                ]
                let audioFile2 = try AVAudioFile(forWriting: filePath2, settings: recordSetting)
                mixer.installTap(onBus: 0, bufferSize: 4096, format: mixer.outputFormat(forBus: 0)) { (buffer, when) in
                    do {
                        try audioFile2.write(from: buffer)
                    } catch let error {
                        print("audioFile2.writeFromBuffer error:", error)
                    }
                }
                try audioEngine.start()
                player.play()
            } catch let error {
                print(error)
            }
        } else {
            print("File not found")
        }
        iyahon = songFile
    }
    
    func levelTimerCallback() {
        mixerMeter.updateMeters()
        let dB = mixerMeter.averagePowerForChannel0
        let atai = max(0, (dB + 77)) / 77
        nami1.progress = atai
        nami2.progress = atai
        nami3.progress = atai
    }
    
    
    
    func stop() {
        audioEngine.mainMixerNode.removeTap(onBus: 0)
        self.audioEngine.stop()
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
            stop()
            nextGamenn()
        }else{
             timeCount += 1
        }
    }
    
    
    @IBAction func back(_ sender: AnyObject) {
        timer?.invalidate()
        timeCountTimer?.invalidate()
        audioEngine?.mainMixerNode.removeTap(onBus: 0)
        audioEngine?.stop()
        self.dismiss(animated: true, completion: nil)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
}





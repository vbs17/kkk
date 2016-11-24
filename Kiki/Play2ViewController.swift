
import UIKit
import AVFoundation
import MediaPlayer


class Play2ViewController: UIViewController {
    var songData2:URL!
    var songData:URL!
    var playSong:AVAudioPlayer!
    var timer = Timer()
    let recordSetting : [String : AnyObject] = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
        AVNumberOfChannelsKey: 1 as AnyObject ,
        AVSampleRateKey: 44100 as AnyObject
    ]
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var byou: UILabel!
    @IBOutlet weak var retake: UIButton!
    @IBOutlet weak var ok: UIButton!
    @IBOutlet weak var onbyou: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //二つとも再生
        let sound2:AVAudioPlayer = try! AVAudioPlayer(contentsOf: songData2!)
        playSong = sound2
        sound2.prepareToPlay()
        
        
    }
    //二つとも再生
    @IBAction func playGo(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(PlayViewController.updatePlayingTime), userInfo: nil, repeats: true)
        playSong.play()
        play.isEnabled = false
        back.isEnabled = true
    }
    @IBAction func backGo(_ sender: AnyObject) {
        onbyou.text = "0:00"
        play.isEnabled = true
        back.isEnabled = false
        playSong.stop()
        playSong.prepareToPlay()
        playSong.currentTime = 0

    }
    //保存したのを送る
    @IBAction func okGo(_ sender: AnyObject) {
        playSong.stop()
        timer.invalidate()
        let sendviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Send") as! SendViewController
        sendviewcontroller.songData = songData2
        self.present(sendviewcontroller, animated: true, completion: nil)
        
    }
    
    @IBAction func retakeGo(_ sender: AnyObject) {
        playSong.stop()
        timer.invalidate()
        let deleteSong = try!AVAudioRecorder(url: songData2,settings:recordSetting)
        deleteSong.deleteRecording()
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top2") as! _TViewController
        viewcontroller.songData = self.songData
        self.present(viewcontroller, animated: true, completion: nil)
        let manager = FileManager()
        if manager.fileExists(atPath: songData2.absoluteString){
            print("ok")
        }else{
            print("no")
        }

    }
    
    func updatePlayingTime() {
        //細かすぎるとあうわけないから
        if  floor(playSong.currentTime) ==  floor(playSong.duration) {
            timer.invalidate()
            onbyou.text = formatTimeString(playSong.duration)
            return
        }
        
        onbyou.text = formatTimeString(playSong.currentTime)
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
    

}

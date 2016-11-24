

import UIKit
import AVFoundation
import MediaPlayer

class PlayViewController: UIViewController {
    //曲はここ
    //filenameをsongDataに渡す
    var songData:URL!
    var playSong:AVAudioPlayer!
    var timer = Timer()
    let recordSetting : [String : AnyObject] = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC) as AnyObject,
        AVNumberOfChannelsKey: 1 as AnyObject ,
        AVSampleRateKey: 44100 as AnyObject
    ]
    
    @IBOutlet weak var onbyou: UILabel!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var byou: UILabel!
    @IBOutlet weak var retake: UIButton!
    @IBOutlet weak var ok: UIButton!
   
    //秒数がすでに表示
    override func viewDidLoad() {
        super.viewDidLoad()
        //曲はここ
        let sound:AVAudioPlayer = try! AVAudioPlayer(contentsOf: songData!)
        playSong = sound
        sound.prepareToPlay()
        byou.text = formatTimeString(sound.duration)
        play.layer.cornerRadius = 15
        play.clipsToBounds = true
        back.layer.cornerRadius = 15
        back.clipsToBounds = true
        retake.layer.cornerRadius = 10
        retake.clipsToBounds = true
        ok.layer.cornerRadius = 10
        ok.clipsToBounds = true
    }
    //ここら辺
    @IBAction func kasane(_ sender: AnyObject) {
        playSong.stop()
        timer.invalidate()
        let recviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top2") as! _TViewController
        recviewcontroller.songData = songData
         let recviewcontroller1 = self.storyboard?.instantiateViewController(withIdentifier: "Iya")

        self.present(recviewcontroller1!, animated: true, completion: nil)
    }
    
    //再生
    @IBAction func goPlay(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(PlayViewController.updatePlayingTime), userInfo: nil, repeats: true)
        playSong.play()
        play.isEnabled = false
        back.isEnabled = true
    }
    
    //mp3に圧縮させて投稿
    @IBAction func gok(_ sender: AnyObject) {
        playSong.stop()
        timer.invalidate()
        let sendviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Send") as! SendViewController
        sendviewcontroller.songData = songData
         self.present(sendviewcontroller, animated: true, completion: nil)
    }
    
       //巻き戻し
    @IBAction func goBack(_ sender: UIButton) {
        onbyou.text = "0:00"
        play.isEnabled = true
        back.isEnabled = false
        playSong.stop()
        timer.invalidate()
        playSong.prepareToPlay()
        playSong.currentTime = 0
    }
    
    //取り直し
    @IBAction func retake(_ sender: AnyObject) {
        playSong.stop()
        timer.invalidate()
        let deleteSong = try!AVAudioRecorder(url: songData,settings:recordSetting)
        deleteSong.deleteRecording()
        let viewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Top") as! ViewController
        self.present(viewcontroller, animated: true, completion: nil)
        let manager = FileManager()
        if manager.fileExists(atPath: songData.absoluteString){
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

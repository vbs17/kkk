

import UIKit

class SendViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //filenameをsongDataに渡す
    var songData:URL!
    
    @IBOutlet weak var library: UIButton!
    @IBOutlet weak var camera: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        library.layer.cornerRadius = 10
        library.clipsToBounds = true
        camera.layer.cornerRadius = 10
        camera.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func camGo(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.camera
            present(pickerController, animated: true, completion: nil)
        }

    }
    
    @IBAction func libGo(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            present(pickerController, animated: true, completion: nil)
         }
    }
    
    
       
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            // 撮影/選択された画像を取得する
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // ここでpresentViewControllerを呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                
                // AdobeImageEditorを起動する
                let okviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Ok") as! OkViewController
                okviewcontroller.image = image
                okviewcontroller.songData = self.songData
                self.present(okviewcontroller, animated: true, completion:  nil)
            }
        }
        
        // 閉じる
        picker.dismiss(animated: true, completion: nil)
    }

  }


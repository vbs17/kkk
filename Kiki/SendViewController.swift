

import UIKit

class SendViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //filenameをsongDataに渡す
    var songData:URL!
    var original: String?
    var cover:String?
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
            
            //作業項目の実行を管理
            
            DispatchQueue.main.async {
                
                // AdobeImageEditorを起動する
                let okviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Ok") as! OkViewController
                let size = CGSize(width: 1242, height: 828)
                //ビットマップベースのグラフィックスコンテキストを作成し、それを現在のコンテキストにする
                UIGraphicsBeginImageContext(size)
                //指定された矩形内にイメージ全体を描画し、必要に応じてサイズを変更してフィットさせる
                //長方形の位置と大きさを含む構造体
                image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
                //現在のビットマップベースのグラフィックスコンテキストの内容に基づいてイメージを返す
                let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
                okviewcontroller.image = resizeImage
                okviewcontroller.songData = self.songData
                okviewcontroller.original = self.original
                okviewcontroller.cover = self.cover
                self.present(okviewcontroller, animated: true, completion:  nil)
            }
        }
        
        // 閉じる
        picker.dismiss(animated: true, completion: nil)
    }

  }


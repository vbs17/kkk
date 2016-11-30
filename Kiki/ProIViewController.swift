import UIKit
import Photos

class ProIViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        // librayボタンのenabled = falseに設定
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
            switch status {
                /*
                 まだ一度も権限を設定していない場合は.NotDeternubedになりますが、PHPhotoLibrary.requestAuthorizationは
                 初回起動時に限り、許可を求めますので、このブロック文を使うと.NotDeterminedになる状態は有り得ません。
                 case .NotDetermined:
                 // ユーザーはまだ、このアプリに与える権限を選択をしていない
                 */
                
            case .restricted:
                // PhotoLibraryへのアクセスが許可されていない
                // parental controlなどで制限されていて、ユーザーはアプリのアクセスの許可を変更できない
                // この時は完全に無理です。
                break;
                
            case .denied:
                // ユーザーが明示的に、アプリが写真のデータへアクセスすることを拒否した
                // この時は設定アプリに飛ばす方法も考えられますし、Alertを表示するだけという選択肢もあります。
                break;
                
            case .authorized:
                // ユーザーが、アプリが写真のデータへアクセスすることを許可している
                // この時は@IBAction func library(sender: AnyObject)を呼び出せます。
                // つまり、ここで初めてlibraryボタンをenabled = trueにしてください。
                break;
            default:
                break;
            }
        }
        
    }

    @IBAction func camera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.camera
            present(pickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func library(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            present(pickerController, animated: true, completion: nil)
            
        }
    }
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            
            DispatchQueue.main.async {
                
                let proviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Pro") as! ProViewController
                let size = CGSize(width: 1242, height: 828)
                UIGraphicsBeginImageContext(size)
                image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
                let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
                proviewcontroller.image = resizeImage
                self.present(proviewcontroller, animated: true, completion:  nil)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}


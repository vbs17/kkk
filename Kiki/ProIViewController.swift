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
                
            case .Restricted:
                // PhotoLibraryへのアクセスが許可されていない
                // parental controlなどで制限されていて、ユーザーはアプリのアクセスの許可を変更できない
                // この時は完全に無理です。
                break;
                
            case .Denied:
                // ユーザーが明示的に、アプリが写真のデータへアクセスすることを拒否した
                // この時は設定アプリに飛ばす方法も考えられますし、Alertを表示するだけという選択肢もあります。
                break;
                
            case .Authorized:
                // ユーザーが、アプリが写真のデータへアクセスすることを許可している
                // この時は@IBAction func library(sender: AnyObject)を呼び出せます。
                // つまり、ここで初めてlibraryボタンをenabled = trueにしてください。
                break;
            default:
                break;
            }
        }
        
    }

    @IBAction func camera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(pickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func library(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(pickerController, animated: true, completion: nil)
            
        }
    }
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if info[UIImagePickerControllerOriginalImage] != nil {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            
            dispatch_async(dispatch_get_main_queue()) {
                
                let proviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Pro") as! ProViewController
                proviewcontroller.image = image
                self.presentViewController(proviewcontroller, animated: true, completion:  nil)
            }
        }
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
}


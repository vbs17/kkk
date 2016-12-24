import UIKit
import Photos

class ProIViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    @IBOutlet weak var back: UIButton!
    
    
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

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        back.layer.cornerRadius = 37
        back.clipsToBounds = true
        // librayボタンのenabled = falseに設定
        PHPhotoLibrary.requestAuthorization { (status) -> Void in
            switch status {
                
            case .restricted:
                
                break;
                
            case .denied:
                
                break;
                
            case .authorized:
                
                break;
            default:
                break;
            }
        }
        
    }

    
    
    
    
}




import UIKit
import FirebaseAuth


class BasyoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var back: UIButton!
    var window: UIWindow?
  
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
        let ProViewController = self.storyboard?.instantiateViewController(withIdentifier: "Syuru")
        self.present(ProViewController!, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ud = UserDefaults.standard
        let isTutorial2 = ud.bool(forKey: CommonConst.IsTutorial2 )
        if isTutorial2 == false {
            let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController:UIViewController = storyboard.instantiateViewController(withIdentifier: "Syutyu")
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        back.layer.cornerRadius = 37
        back.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            
            if info[UIImagePickerControllerOriginalImage] != nil {
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                
              
                DispatchQueue.main.async {
                    
                    let syugoviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Syugo") as! SyugoViewController
                    syugoviewcontroller.image = image
                    self.present(syugoviewcontroller, animated: true, completion:  nil)
                }
            }
             picker.dismiss(animated: true, completion: nil)
        }

    

 
   }
 



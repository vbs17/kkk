

import UIKit
import FirebaseAuth


class BasyoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var back: UIButton!
    var window: UIWindow?
  
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
        let ProViewController = self.storyboard?.instantiateViewControllerWithIdentifier("Syuru")
        self.presentViewController(ProViewController!, animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let ud = NSUserDefaults.standardUserDefaults()
        let isTutorial2 = ud.boolForKey(CommonConst.IsTutorial2 )
        if isTutorial2 == false {
            let storyboard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let viewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("Syutyu")
            self.presentViewController(viewController, animated: false, completion: nil)
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
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            
            if info[UIImagePickerControllerOriginalImage] != nil {
                let image = info[UIImagePickerControllerOriginalImage] as! UIImage
                
              
                dispatch_async(dispatch_get_main_queue()) {
                    
                    let syugoviewcontroller = self.storyboard?.instantiateViewControllerWithIdentifier("Syugo") as! SyugoViewController
                    syugoviewcontroller.image = image
                    self.presentViewController(syugoviewcontroller, animated: true, completion:  nil)
                }
            }
             picker.dismissViewControllerAnimated(true, completion: nil)
        }

    

 
   }
 



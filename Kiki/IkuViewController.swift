

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import AVFoundation
import Spring

class IkuViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var postArray2:[PostData2] = []
    var join: [String] = []
    var observing = false


    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "IkuTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "IkuT")
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IkuT", for: indexPath) as! IkuTableViewCell
        let uid = join[indexPath.row]
        var name:String = ""
        var image:UIImage? = nil
                for id in postArray2{
            if uid == id.uid{
                name = id.name!
                image = cropImageToSquare(id.image!)
            }
        }
        cell.label.text = name
        cell.imageview!.image = image

        return cell
    }
    
    func cropImageToSquare(_ image:UIImage) -> UIImage? {
        if image.size.width > image.size.height {
            // 横長
            let cropCGImageRef = image.cgImage?.cropping(to: CGRect(x: image.size.width/2 - image.size.height/2, y: 0, width: image.size.height, height: image.size.height))
            
            return UIImage(cgImage: cropCGImageRef!)
        } else if image.size.width < image.size.height {
            // 縦長
            let cropCGImageRef = image.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.width))
            
            return UIImage(cgImage: cropCGImageRef!)
        } else {
            return image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return join.count
    }
       

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if FIRAuth.auth()?.currentUser != nil {
            if observing == false {
                FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childAdded, with: { snapshot in
                    
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        self.postArray2.insert(postData, at: 0)
                        self.tableView.reloadData()
                    }
                })
                
                FIRDatabase.database().reference().child(CommonConst.Profile).observe(.childChanged, with: { snapshot in
                    if let uid = FIRAuth.auth()?.currentUser?.uid {
                        let postData = PostData2(snapshot: snapshot, myId: uid)
                        
                        var index: Int = 0
                        for post in self.postArray2 {
                            if post.id == postData.id {
                                index = self.postArray2.index(of: post)!
                                break
                            }
                        }
                        self.postArray2.remove(at: index)
                        self.postArray2.insert(postData, at: index)
                        self.tableView.reloadData()
                    }
                })
                
                observing = true
            }
        } else {
            if observing == true {
                postArray2 = []
                tableView.reloadData()
                FIRDatabase.database().reference().removeAllObservers()
                observing = false
            }
        }
    }


    
    

}

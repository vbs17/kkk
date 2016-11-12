

import UIKit

class HitotatiViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var postArray2:[PostData2] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "HitoTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Hito")
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Hito", forIndexPath: indexPath) as! HitoTableViewCell
        return cell
    }

    func pro(sender: UIButton, event:UIEvent) {
        let touch = event.allTouches()?.first
        let point = touch!.locationInView(self.tableView)
        let indexPath = tableView.indexPathForRowAtPoint(point)
        let postData = postArray2[indexPath!.row]
        let pro = self.storyboard?.instantiateViewControllerWithIdentifier("Pi") as! ProIdouViewController
        pro.uid = postData.uid
        self.presentViewController(pro, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray2.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

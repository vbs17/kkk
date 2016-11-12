

import UIKit

class IkuViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var postArray2:[PostData2] = []

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "IkuTableViewCell1", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "IkuT")
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IkuT", forIndexPath: indexPath) as! IkuTableViewCell

        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray2.count
    }
       

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    


}

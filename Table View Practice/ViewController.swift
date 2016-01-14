
import UIKit
//add tableViewDataSource and Delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    

    @IBOutlet weak var myTableView: UITableView!
    var superHeros = ["Batman", "Wonderwoman", "Superman", "Flash", "Aquaman", "Scuba Steve"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Barry Allen", "Arthur Curry", "Steve"]
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //setting datasource and delegate to the view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    //creating a cell that would store your data on a tableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superHeros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    //sets the nuber of rows in your tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    
        return superHeros.count
    }
}


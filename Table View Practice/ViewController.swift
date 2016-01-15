
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
    //when the add button is tapped on the bar button
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        //this line of code creates an alert
        let myAlert = UIAlertController(title: "Add superhero", message: nil, preferredStyle: .Alert)
        // this line of code creates a cancel button on this alert
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        //**ERROR** IN THE FOLLOWING FUNCTION IT IS NOT RECOGNIZING SUPERHERONAMETEXTFIELD WHEN I TRY TO APPEND IT TO THE ARRAY.
        let addAction = UIAlertAction(title: "Add", style: .Default)
        { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0] as UITextField
            let aliasTextField = myAlert.textFields![1] as UITextField
            self.superHeros.append(superherTextField.text!)
            self.realNames.append(aliasTextField.text!)
           self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        //add text field
        myAlert.addTextFieldWithConfigurationHandler
        {
            (superheroTextField) -> Void in
            superheroTextField.placeholder = "Add superhero name"
        }
        //add text field
        myAlert.addTextFieldWithConfigurationHandler
        {
                (aliasTextField) -> Void in
                aliasTextField.placeholder = "Add real name"
        }

        
        
        //this line of code presents the alert in the View Controller
        self.presentViewController(myAlert, animated: true, completion: nil)
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
    //allows you to delete rows from the tableview
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superHeros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    
    
    }
}


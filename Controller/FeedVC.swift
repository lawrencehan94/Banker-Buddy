import UIKit
import CoreData

//APP DELEGATE
let appDelegate = UIApplication.shared.delegate as? AppDelegate

//FEED CLASS
class FeedVC {
  
  var deals = [Deal]()
  
  viewDidLoad() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}

//TABLE VIEW
extension FeedVC: UITableViewDelegate, UITableViewDataSource {

  numberOfSections() -> Int {
    return 1
  }
  
  numberOfRows() -> Int {
    return deals.count  
  }
  
  cellForRowAt(tableView, indexPath) -> UITableviewCell() {
    guard let feedCell = tableView.dequeueReusableCell("FeedCell") as? FeedCell else {return UITableViewCell()}
    let dealAtIndexPathRow = deals[indexPath.row]
    feedCell.configureCell(deal: dealAtIndexPathRow)
    return feedCell
  }

}

//CORE DATA
func fetch(completion: (_ complete: Bool) -> ()) {
  guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
  let fetchRequest = NSFetchRequest<Deal>(entityName: "Deal")
  
  do {
    deals = try managedContext.fetch(fetchRequest)
    completion(true)
  } catch {
    debugPrint("Could not fetch: \(error.localizedDescription)")
    completion(false)
  }
}


//GENERAL NOTES
// A managed object context is a scratchpad where you can work with your managed objects (or the objects you want to save)
// My function, "fetch" is going to return a completion variable (inside a completion handler) that is either true or false. 
// This will allow whomever is fetching the data through the "fetch" function to set  what will happen if completion is true or false
// You need to fetch Core Data and set it to your array of deals
// deals = try managedContext.fetch(NSFetchRequest<Deal>(entityName: "Deal")

//NOTES ON APP DELEGATE
// An app delegate sits in the middle of everything - it's the entry point to your application
// iOS (user presses volume up button or pause button), then app delegate goes to navigation controller then changes the view / something in the model
// an appdelegate is a singleton (there's only one of it), and is guaranteed to be there (unlike VCs, which can be destroyed by the system to save memory)
// appdelegate tells vc to pause / play
// push notification goes to app delegate then goes to function that does something (plays music, etc.)

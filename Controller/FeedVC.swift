import UIKit
import CoreData

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

}


//NOTES
// A managed object context is a scratchpad where you can work with your managed objects (or the objects you want to save)
// My function, "fetch" is going to return a completion variable (inside a completion handler) that is either true or false. 
// This will allow whomever is fetching the data through the "fetch" function to set  what will happen if completion is true or false

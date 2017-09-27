import UIKit
import CoreData

class FeedVC {
  
  var deals = [Deal]()
  
  viewDidLoad() {
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}

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

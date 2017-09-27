import UIKit

class FeedCell: UITableViewCell {

  @IBOutlet weak var dealLabel: String!
  @IBOutlet weak var enterpriseValueLabel: String!
  @IBOutlet weak var LTMRevenueMultipleLabel: String!
  
  func configureCell(deal: String, enterpriseValue: Double, LTMRevenueMultiple: Double) {
    self.dealLabel.text = deal
    self.enterpriseValueLabel.text = String(enterpriseValue)
    self.LTMRevenueMultipleLabel.text = String(LTMRevenueMultiple)
  }
  
  // Instead of making the parameters deal, enterpriseValue, LTMRevenueMultiple, make it the coredata entity that you created
  // func configureCell(deal: Deal) 
  // Here the parameter is of type Deal (the entity that you created with deal, enterpriseValue, and LTMRevenueMultiple properties)

}

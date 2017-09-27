import UIKit

class FeedCell: UITableViewCell {

  @IBOutlet weak var dealLabel: String?
  @IBOutlet weak var enterpriseValueLabel: String?
  @IBOutlet weak var LTMRevenueMultipleLabel: String?
  
  func configureCell(deal: String, enterpriseValue: Double, LTMRevenueMultiple: Double) {
    self.dealLabel.text = deal
    self.enterpriseValueLabel.text = String(enterpriseValue)
    self.LTMRevenueMultipleLabel.text = String(LTMRevenueMultiple)
  }

}

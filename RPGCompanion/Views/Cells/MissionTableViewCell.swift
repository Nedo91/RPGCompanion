import UIKit

class MissionTableViewCell: UITableViewCell {
  @IBOutlet weak var missionName: UILabel!
  @IBOutlet weak var reqLevel: UILabel!
  @IBOutlet weak var reqIntelect: UILabel!
  @IBOutlet weak var reqStrength: UILabel!
  @IBOutlet weak var reqAgility: UILabel!
  @IBOutlet weak var experienceGained: UILabel!

  func setup(model: MissionViewModel) {
    self.missionName.text = "Nazwa misji: \(model.name)"
    self.reqLevel.text = "Req LVL: \(model.reqLvl)"
    self.reqIntelect.text = "Req LVL: \(model.reqInt)"
    self.reqAgility.text = "Req LVL: \(model.reqAgi)"
    self.reqStrength.text = "Req LVL: \(model.reqStr)"
    self.experienceGained.text = "Req LVL: \(model.experienceGained)"
  }
}

import UIKit

class MissionTableViewCell: UITableViewCell {

  @IBOutlet weak var missionName: UILabel!
  @IBOutlet weak var reqLevel: UILabel!
  @IBOutlet weak var reqIntelect: UILabel!
  @IBOutlet weak var reqStrength: UILabel!
  @IBOutlet weak var reqAgility: UILabel!
  @IBOutlet weak var experienceGained: UILabel!
  
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

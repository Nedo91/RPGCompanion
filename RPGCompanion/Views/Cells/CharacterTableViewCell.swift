//
//  CharacterTableViewCell.swift
//  RPGCompanion
//
//  Created by Nedeljko Mijajlovic on 16/01/2019.
//  Copyright © 2019 Nedeljko Mijajlovic. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

  @IBOutlet weak var characterLevel: UILabel!
  @IBOutlet weak var characterName: UILabel!
  @IBOutlet weak var characterStr: UILabel!
  @IBOutlet weak var characterInt: UILabel!
  @IBOutlet weak var characterAgi: UILabel!
  @IBOutlet weak var characterStamina: UILabel!
  @IBOutlet weak var characterExp: UILabel!
  
  
  
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

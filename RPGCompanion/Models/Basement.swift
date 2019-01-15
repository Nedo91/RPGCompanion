import Foundation

class Basement {
    var id: Int!
    var characterId: Int!
    var missionBonus: Int!
    var basementType: BasementTypeEnum!

    public init(id: Int!, characterId: Int!, missionBonus: Int!, basementType: BasementTypeEnum!) {
        self.id = id
        self.characterId = characterId
        self.missionBonus = missionBonus
        self.basementType = basementType
    }
}

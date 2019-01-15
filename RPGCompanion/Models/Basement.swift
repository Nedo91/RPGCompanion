import Foundation

final class Basement: BaseEntity {
  var characterId: Int!
  var missionBonus: Int!
  var basementType: BasementTypeEnum!

  public init(id: Int?, characterId: Int!, missionBonus: Int!, basementType: BasementTypeEnum!) {
    super.init(id: id)
    self.characterId = characterId
    self.missionBonus = missionBonus
    self.basementType = basementType
  }
}

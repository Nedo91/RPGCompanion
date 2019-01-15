import Foundation

final class Buildings: BaseEntity {
  var basementId: Int!
  var buildingType: BuildingTypeEnum!
  var buildingLevel: BuildingLevelEnum!

  public init(id: Int?, basementId: Int!, buildingType: BuildingTypeEnum!, buildingLevel: BuildingLevelEnum!) {
    super.init(id: id)
    self.basementId = basementId
    self.buildingType = buildingType
    self.buildingLevel = buildingLevel
  }
}

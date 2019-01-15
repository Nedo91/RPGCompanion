import Foundation

class Buildings {
    var id: Int!
    var basementId: Int!
    var buildingType: BuildingTypeEnum!
    var buildingLevel: BuildingLevelEnum!

    public init(id: Int!, basementId: Int!, buildingType: BuildingTypeEnum!, buildingLevel: BuildingLevelEnum!) {
        self.id = id
        self.basementId = basementId
        self.buildingType = buildingType
        self.buildingLevel = buildingLevel
    }
}

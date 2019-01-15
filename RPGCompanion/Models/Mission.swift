import Foundation

final class Mission: BaseEntity {
  var characterId: Int!
  var name: String!
  var reqComputedPoints: Int!

  public init(id: Int?, characterId: Int!, name: String!, reqComputedPoints: Int!) {
    super.init(id: id)
    self.characterId = characterId
    self.name = name
    self.reqComputedPoints = reqComputedPoints
  }
}

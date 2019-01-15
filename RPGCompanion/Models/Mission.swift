import Foundation

class Mission  {
    var id: Int!
    var characterId: Int!
    var name: String!
    var reqComputedPoints: Int!

    public init(id: Int!, characterId: Int!, name: String!, reqComputedPoints: Int!) {
        self.id = id
        self.characterId = characterId
        self.name = name
        self.reqComputedPoints = reqComputedPoints
    }
}

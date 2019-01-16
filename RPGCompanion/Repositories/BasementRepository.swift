import Foundation
import SQLite

class BasementRepository: BaseRepository {
  let characterIdExpression = Expression<Int>("characterId")
  let basementTypeExpression = Expression<Int>("basementType")
  let missionBonusExpression = Expression<Int>("missionBonus")

  override var table: Table {
    return Table("Basemment")
  }

  override func createTable(connection: Connection) throws {
    try connection.run(table.create { table in
      table.column(idExpression, primaryKey: .autoincrement)
      table.column(characterIdExpression)
      table.column(basementTypeExpression)
      table.column(missionBonusExpression)
    })
  }

  override func getSetters(item: BaseEntityProtocol) -> [Setter] {
    guard let basement = item as? Basement else {
      return []
    }

    return [
      self.characterIdExpression <- basement.characterId,
      self.missionBonusExpression <- basement.missionBonus,
      self.basementTypeExpression <- basement.basementType!.rawValue
    ]
  }

  internal override func mapToModel(row: Row) -> BaseEntityProtocol {
    return Basement(id: row[idExpression],
      characterId: row[characterIdExpression],
      missionBonus: row[missionBonusExpression],
      basementType: BasementTypeEnum(rawValue: row[basementTypeExpression]))
  }
}


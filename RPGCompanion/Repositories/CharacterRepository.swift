import Foundation
import SQLite

class CharacterRepository: BaseRepository {
  let strengthExpression = Expression<Int>("strength")
  let intelectExpression = Expression<Int>("intelect")
  let agilityExpression = Expression<Int>("agility")
  let staminaExpression = Expression<Int>("stamina")
  let genderExpression = Expression<String>("gender")
  let ageExpression = Expression<Int>("age")
  let raceExpression = Expression<String>("race")
  let nickExpression = Expression<String>("nick")
  let createDateExpression = Expression<Date>("createDate")
  let currentLevelExpression = Expression<Int>("currentLevel")

  override var table: Table {
    return Table("Chars")
  }

  override func createTable(connection: Connection) throws {
    try connection.run(table.create { table in
      table.column(idExpression, primaryKey: .autoincrement)
      table.column(strengthExpression)
      table.column(intelectExpression)
      table.column(agilityExpression)
      table.column(staminaExpression)
      table.column(genderExpression)
      table.column(ageExpression)
      table.column(raceExpression)
      table.column(nickExpression, unique: true)
      table.column(createDateExpression)
      table.column(currentLevelExpression)
    })
  }

  override func getSetters(item: BaseEntityProtocol) -> [Setter] {
    guard let char = item as? Character else {
      return []
    }

    return [
      self.strengthExpression <- char.strength,
      self.intelectExpression <- char.intelect,
      self.agilityExpression <- char.agility,
      self.staminaExpression <- char.stamina,
      self.genderExpression <- char.gender,
      self.ageExpression <- char.age,
      self.raceExpression <- char.race,
      self.nickExpression <- char.nick,
      self.createDateExpression <- char.createDate,
      self.currentLevelExpression <- char.currentLevel
    ]
  }

  internal override func mapToModel(row: Row) -> BaseEntityProtocol {
    return Character(
      id: row[idExpression],
      strength: row[strengthExpression],
      intelect: row[intelectExpression],
      agility: row[agilityExpression],
      stamina: row[staminaExpression],
      gender: row[genderExpression],
      age: row[ageExpression],
      race: row[raceExpression],
      nick: row[nickExpression],
      createDate: row[createDateExpression],
      currentLevel: row[currentLevelExpression]
    )
  }
}

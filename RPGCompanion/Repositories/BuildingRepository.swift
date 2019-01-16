import Foundation
import SQLite

class BuildingRepository: BaseRepository {
  let basementIdExpression = Expression<Int>("basementId")
  let buildingTypeExpression = Expression<Int>("buildingType")
  let buildingLevelExpression = Expression<Int>("buildingLevel")

  override var table: Table {
    return Table("Building")
  }

  override func createTable(connection: Connection) throws {
    try connection.run(table.create { table in
      table.column(idExpression, primaryKey: .autoincrement)
      table.column(basementIdExpression)
      table.column(buildingTypeExpression)
      table.column(buildingLevelExpression)
    })
  }

  override func getSetters(item: BaseEntityProtocol) -> [Setter] {

    guard let building = item as? Buildings else {
      return []
    }
    return [
      self.basementIdExpression <- building.basementId,
      self.buildingLevelExpression <- building.buildingLevel!.rawValue,
      self.buildingTypeExpression <- building.buildingType!.rawValue
    ]
  }

  internal override func mapToModel(row: Row) -> BaseEntityProtocol {
    return Buildings(id: row[idExpression],
      basementId: row[basementIdExpression],
      buildingType: BuildingTypeEnum(rawValue: row[buildingTypeExpression]),
      buildingLevel: BuildingLevelEnum(rawValue: row[buildingLevelExpression]))
  }
}



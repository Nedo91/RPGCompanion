import Foundation
import SQLite

class MissionRepository: BaseRepository {
    let characterIdExpression = Expression<Int>("characterId")
    let nameExpression = Expression<String>("name")
    let reqComputedPointsExpression = Expression<Int>("reqComputedPoints")
    
    override var table: Table {
        return Table("Missions")
    }
    
    override func createTable(connection: Connection) throws {
        try connection.run(table.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(characterIdExpression)
            table.column(nameExpression)
            table.column(reqComputedPointsExpression)
        })
    }
    
    override func getSetters(item: BaseEntityProtocol) -> [Setter] {
        guard let mission = item as? Mission else {
            return []
        }
        
        return [
            self.characterIdExpression <- mission.characterId,
            self.nameExpression <- mission.name,
            self.reqComputedPointsExpression <- mission.reqComputedPoints
        ]
    }
    
    internal override func mapToModel(row: Row) -> BaseEntityProtocol {
        return Mission(id: row[idExpression],
                         characterId: row[characterIdExpression],
                         name: row[nameExpression],
                         reqComputedPoints: row[reqComputedPointsExpression])
    }
}



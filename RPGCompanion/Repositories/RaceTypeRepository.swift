import Foundation
import SQLite

class RaceTypeRepository: BaseRepository {
    
    let staminaMultiplicatorExpression = Expression<Double>("staminaMultiplicator")
    
    override var table: Table {
        return Table("raceTypes")
    }
    
    func creatTable(connection: Connection) throws {
        try connection.run(table.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(staminaMultiplicatorExpression)
        })
    }
    
    override func getSetters(item: BaseEntityProtocol) -> [Setter] {
        guard let raceType = item as? RaceType else {
            return []
        }
        
        return [
        self.staminaMultiplicatorExpression <- raceType.staminaMultiplicator
        ]
    }
    
    internal override func mapToModel(row: Row) -> BaseEntityProtocol {
        return RaceType(id: row[idExpression],staminaMultiplicator: row[staminaMultiplicatorExpression])
    }
}

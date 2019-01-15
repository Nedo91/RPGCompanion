import Foundation
import SQLite

class ClassTypeRepository: BaseRepository {

    let strengthMultiplicatorExpression = Expression<Double>("strengthMultiplicator")
    let intelectMultiplicatorExpression = Expression<Double>("intelectMultiplicator")
    let agilityMultiplicatorExpression = Expression<Double>("agilityMultiplicator")
    
    override var table: Table {
        return Table("classType")
    }
    
    override func createTable(connection: Connection) throws {
        try connection.run(table.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(intelectMultiplicatorExpression)
            table.column(strengthMultiplicatorExpression)
            table.column(agilityMultiplicatorExpression)
        })
    }
    
    override func getSetters(item: BaseEntityProtocol) -> [Setter] {
        guard let classType = item as? ClassType else {
            return []
        }
        return [
            self.intelectMultiplicatorExpression <- classType.intelectMultiplicator,
            self.agilityMultiplicatorExpression <- classType.agilityMultiplicator,
            self.strengthMultiplicatorExpression <- classType.strengthMultiplicator
        ]
    }
    
    internal override func mapToModel(row: Row) -> BaseEntityProtocol {
        return ClassType(id: row[idExpression],
                         agilityMultiplicator: row[agilityMultiplicatorExpression],
                         strengthMultiplicator: row[strengthMultiplicatorExpression],
                         intelectMultiplicator: row[intelectMultiplicatorExpression])
    }  
}


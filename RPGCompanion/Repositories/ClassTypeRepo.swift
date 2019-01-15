import Foundation
import SQLite

class ClassTypeRepository {
    let idExpression = Expression<Int>("id")
    let strengthMultiplicatorExpression = Expression<Double>("strengthMultiplicator")
    let intelectMultiplicatorExpression = Expression<Double>("intelectMultiplicator")
    let agilityMultiplicatorExpression = Expression<Double>("agilityMultiplicator")
    
    let classTypes = Table("classTypes")
    
    func createClassTypeTable(connection: Connection) throws {
        try connection.run(classTypes.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(intelectMultiplicatorExpression)
            table.column(strengthMultiplicatorExpression)
            table.column(agilityMultiplicatorExpression)
        })
    }
    
    func getCharClassTypes(connection: Connection) -> [ClassType] {
        do {
            let rows = try connection.prepare(classTypes)
            return rows.compactMap { row -> ClassType in
                return mapToClassType(row: row)
            }
        } catch {
            return []
        }
    }
    
    private func mapToClassType(row: Row) -> ClassType {
        return ClassType(id: row[idExpression],
                         agilityMultiplicator: row[agilityMultiplicatorExpression],
                         strengthMultiplicator: row[strengthMultiplicatorExpression],
                         intelectMultiplicator: row[intelectMultiplicatorExpression])
    }
    
    func addClassType(classTyp: ClassType, connection: Connection) throws -> Int64 {
        return try connection.run(classTypes.insert(
            self.intelectMultiplicatorExpression <- classTyp.intelectMultiplicator))
    }
    
    func editRaceType(classTyp: ClassType, connection: Connection) throws -> Int {
        guard let id = classTyp.id else {
            return -1
        }
        
        let editDeclaration = classTypes.filter(idExpression == id).update(
            self.intelectMultiplicatorExpression <- classTyp.intelectMultiplicator,
            self.agilityMultiplicatorExpression <- classTyp.agilityMultiplicator,
            self.strengthMultiplicatorExpression <- classTyp.strengthMultiplicator)
        return try connection.run(editDeclaration)
    }
    
    func removeClassType(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = classTypes.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func getById(id: Int, connection: Connection) throws -> ClassType? {
        do {
            let rows = try connection.prepare(classTypes.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToClassType(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
}


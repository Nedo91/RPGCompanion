import Foundation
import SQLite

class RaceTypeRepository {
    let idExpression = Expression<Int>("id")
    let staminaMultiplicatorExpression = Expression<Double>("staminaMultiplicator")
    
    let raceTypes = Table("raceTypes")
    
    func createRaceTypeTable(connection: Connection) throws {
        try connection.run(raceTypes.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(staminaMultiplicatorExpression)
        })
    }
    
    func getCharTypes(connection: Connection) -> [RaceType] {
        do {
            let rows = try connection.prepare(raceTypes)
            return rows.compactMap { row -> RaceType in
                return mapToRaceType(row: row)
            }
        } catch {
            return []
        }
    }
    
    private func mapToRaceType(row: Row) -> RaceType {
        return RaceType(id: row[idExpression], staminaMultiplicator: row[staminaMultiplicatorExpression])
    }
    
    func addRaceType(raceTyp: RaceType, connection: Connection) throws -> Int64 {
        return try connection.run(raceTypes.insert(
            self.staminaMultiplicatorExpression <- raceTyp.staminaMultiplicator))
    }
    
    func editRaceType(raceTyp: RaceType, connection: Connection) throws -> Int {
        guard let id = raceTyp.id else {
            return -1
        }
        
        let editDeclaration = raceTypes.filter(idExpression == id).update(
        self.staminaMultiplicatorExpression <- raceTyp.staminaMultiplicator)
            return try connection.run(editDeclaration)
    }
    
    func removeRaceType(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = raceTypes.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func getById(id: Int, connection: Connection) throws -> RaceType? {
        do {
            let rows = try connection.prepare(raceTypes.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToRaceType(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
}

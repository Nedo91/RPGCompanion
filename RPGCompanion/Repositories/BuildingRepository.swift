import Foundation
import SQLite

class BuildingRepository {
    let idExpression = Expression<Int>("id")
    let characterIdExpression = Expression<Int>("characterId")
    let basementTypeExpression = Expression<Int>("basementType")
    let missionBonusExpression = Expression<Int>("missionBonus")
    
    let basements = Table("basements")
    
    func createBasementTable(connection: Connection) throws {
        try connection.run(basements.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(characterIdExpression)
            table.column(basementTypeExpression)
            table.column(missionBonusExpression)
        })
    }
    
    func getBasements(connection: Connection) -> [Basement] {
        do {
            let rows = try connection.prepare(basements)
            return rows.compactMap { row -> Basement in
                return mapToBasement(row: row)
            }
        } catch {
            return []
        }
    }
    
    private func mapToBasement(row: Row) -> Basement {
        return Basement(id: row[idExpression],
                         characterId: row[characterIdExpression],
                         missionBonus: row[missionBonusExpression],
                         basementType: BasementTypeEnum(rawValue: row[basementTypeExpression]))
    }
    
    func addBasement(basement: Basement, connection: Connection) throws -> Int64 {
        return try connection.run(basements.insert(
        self.characterIdExpression <- basement.characterId,
        self.missionBonusExpression <- basement.missionBonus,
        self.basementTypeExpression <- basement.basementType!.rawValue))
    }
    
    func editBasement(basement: Basement, connection: Connection) throws -> Int {
        guard let id = basement.id else {
            return -1
        }
        
        let editDeclaration = basements.filter(idExpression == id).update(
            self.characterIdExpression <- basement.characterId,
            self.missionBonusExpression <- basement.missionBonus,
            self.basementTypeExpression <- basement.basementType.rawValue)
                return try connection.run(editDeclaration)
    }
    
    func removeBasement(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = basements.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func getById(id: Int, connection: Connection) throws -> Basement? {
        do {
            let rows = try connection.prepare(basements.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToBasement(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
}


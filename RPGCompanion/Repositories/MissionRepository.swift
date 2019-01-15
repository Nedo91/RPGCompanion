import Foundation
import SQLite

class MissionRepository {
    let idExpression = Expression<Int>("id")
    let characterIdExpression = Expression<Int>("characterId")
    let nameExpression = Expression<String>("name")
    let reqComputedPointsExpression = Expression<Int>("reqComputedPoints")
    
    let missions = Table("missions")
    
    func createClassTypeTable(connection: Connection) throws {
        try connection.run(missions.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(characterIdExpression)
            table.column(nameExpression)
            table.column(reqComputedPointsExpression)
        })
    }
    
    func getMissions(connection: Connection) -> [Mission] {
        do {
            let rows = try connection.prepare(missions)
            return rows.compactMap { row -> Mission in
                return mapToMission(row: row)
            }
        } catch {
            return []
        }
    }
    
    private func mapToMission(row: Row) -> Mission {
        return Mission(id: row[idExpression],
                         characterId: row[characterIdExpression],
                         name: row[nameExpression],
                         reqComputedPoints: row[reqComputedPointsExpression])
    }
    
    func addMission(mission: Mission, connection: Connection) throws -> Int64 {
        return try connection.run(missions.insert(
        self.characterIdExpression <- mission.characterId,
        self.nameExpression <- mission.name,
        self.reqComputedPointsExpression <- mission.reqComputedPoints))
    }
    
    func editMission(mission: Mission, connection: Connection) throws -> Int {
        guard let id = mission.id else {
            return -1
        }
        
        let editDeclaration = missions.filter(idExpression == id).update(
            self.characterIdExpression <- mission.characterId,
            self.nameExpression <- mission.name,
            self.reqComputedPointsExpression <- mission.reqComputedPoints)
        return try connection.run(editDeclaration)
    }
    
    func removeMission(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = missions.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func getById(id: Int, connection: Connection) throws -> Mission? {
        do {
            let rows = try connection.prepare(missions.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToMission(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
}



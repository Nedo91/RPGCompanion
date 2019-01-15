import Foundation
import SQLite

class BasementRepository {
    let idExpression = Expression<Int>("id")
    let basementIdExpression = Expression<Int>("basementId")
    let buildingTypeExpression = Expression<Int>("buildingType")
    let buildingLevelExpression = Expression<Int>("buildingLevel")
    
    let buildings = Table("buildings")
    
    func createBuildingsTable(connection: Connection) throws {
        try connection.run(buildings.create { table in
            table.column(idExpression, primaryKey: .autoincrement)
            table.column(basementIdExpression)
            table.column(buildingTypeExpression)
            table.column(buildingLevelExpression)
        })
    }
    
    func getBuildings(connection: Connection) -> [Buildings] {
        do {
            let rows = try connection.prepare(buildings)
            return rows.compactMap { row -> Buildings in
                return mapToBuilding(row: row)
            }
        } catch {
            return []
        }
    }
    
    private func mapToBuilding(row: Row) -> Buildings {
        return Buildings(id: row[idExpression],
                         basementId: row[basementIdExpression],
                         buildingType: BuildingTypeEnum(rawValue: row[buildingTypeExpression]),
                         buildingLevel: BuildingLevelEnum(rawValue: row[buildingLevelExpression]))
    }
    
    func addBuilding(building: Buildings, connection: Connection) throws -> Int64 {
        return try connection.run(buildings.insert(
            self.basementIdExpression <- building.basementId,
            self.buildingLevelExpression <- building.buildingLevel!.rawValue,
            self.buildingTypeExpression <- building.buildingType!.rawValue))
    }
    
    func editBuilding(building: Buildings, connection: Connection) throws -> Int {
        guard let id = building.id else {
            return -1
        }
        
        let editDeclaration = buildings.filter(idExpression == id).update(
            self.basementIdExpression <- building.basementId,
            self.buildingLevelExpression <- building.buildingLevel.rawValue,
            self.buildingTypeExpression <- building.buildingType.rawValue)
        return try connection.run(editDeclaration)
    }
    
    func removeBuilding(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = buildings.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func getById(id: Int, connection: Connection) throws -> Buildings? {
        do {
            let rows = try connection.prepare(buildings.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToBuilding(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
}


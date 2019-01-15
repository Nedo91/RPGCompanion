import Foundation
import SQLite

class CharacterRepository {
    let idExpression = Expression<Int>("id")
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
    
    let chars = Table("Chars")
    
    func createCharacterTable(connection: Connection) throws {
        try connection.run(chars.create { table in
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
    
    func getAllChars(connection: Connection) -> [Character] {
        do {
            let rows = try connection.prepare(chars)
            return rows.compactMap { row -> Character in
                return mapToChar(row: row)
            }
        } catch {
            return []
        }
    }
    
    func getById(id: Int, connection: Connection) throws -> Character? {
        do {
            let rows = try connection.prepare(chars.filter(id == idExpression).limit(1))
            for row in rows {
                return mapToChar(row: row)
            }
            return nil
        } catch {
            return nil
        }
    }
    
    func addChar(char: Character, connection: Connection) throws -> Int64 {
        return try connection.run(chars.insert(
            self.strengthExpression <- char.strength,
            self.intelectExpression <- char.intelect,
            self.agilityExpression <- char.agility,
            self.staminaExpression <- char.stamina,
            self.genderExpression <- char.gender,
            self.ageExpression <- char.age,
            self.raceExpression <- char.race,
            self.nickExpression <- char.nick,
            self.createDateExpression <- char.createDate,
            self.currentLevelExpression <- char.currentLevel)
        )
    }
    
    func removeChar(connection: Connection, idToRemove: Int) throws {
        let removeDeclaration = chars.filter(idExpression == idToRemove).delete()
        try connection.run(removeDeclaration)
    }
    
    func editChar(char: Character, connection: Connection) throws -> Int {
        guard let id = char.id else {
            return -1
        }
        
        let editDeclaration = chars.filter(idExpression == id).update(
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
        )
       
        return try connection.run(editDeclaration)
    }
    
    private func mapToChar(row: Row) -> Character {
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

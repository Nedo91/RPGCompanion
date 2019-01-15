import Foundation
import SQLite

class RPGCompanionDatabase {
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let connection: Connection
    
    init() throws {
        connection = try Connection("\(path)/db.sqlite3")
        createTables()
    }
    
    func createTables() {
        let charRepository = CharacterRepository()
        
        do {
            try charRepository.createCharacterTable(connection: self.connection)
           
        } catch  {
            // silenced
        }
    }
}

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
        do {
            try CharacterRepository().createTable(connection: self.connection)
        } catch  {
            // silenced
        }
    }
}

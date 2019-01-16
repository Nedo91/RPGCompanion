import Foundation
import SQLite

class RPGCompanionDatabase {
  let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

  var connection: Connection? {
    do {
      return try Connection("\(path)/db.sqlite3")
    } catch {
      return nil
    }
  }

  init() {
    createTables()
  }

  func createTables() {
    guard let connection = connection else {
      return
    }

    do {
      try CharacterRepository().createTable(connection: connection)
      try RaceTypeRepository().createTable(connection: connection)
      try ClassTypeRepository().createTable(connection: connection)
      try BuildingRepository().createTable(connection: connection)
      try BasementRepository().createTable(connection: connection)
      try MissionRepository().createTable(connection: connection)
    } catch {
      // silenced
    }
  }
}

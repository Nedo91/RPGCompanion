import SQLite

protocol BaseRepositoryProtocol {
  var idExpression: Expression<Int> { get set }
  var table: Table { get }
  
  func createTable(connection: Connection) throws
  func getAllItems(connection: Connection) -> [BaseEntityProtocol]
  func getById(id: Int, connection: Connection) throws -> BaseEntityProtocol?
  func add(item: BaseEntityProtocol, connection: Connection) throws -> Int64
  func remove(connection: Connection, idToRemove: Int) throws
  func edit(item: BaseEntityProtocol, connection: Connection) throws -> Int
}

class BaseRepository: BaseRepositoryProtocol {
  var idExpression: Expression<Int> = Expression<Int>("id")

  func getAllItems(connection: Connection) -> [BaseEntityProtocol] {
    do {
      let rows = try connection.prepare(table)
      return rows.compactMap { row -> BaseEntityProtocol in
        return mapToModel(row: row)
      }
    } catch {
      return []
    }
  }
  
  func getById(id: Int, connection: Connection) throws -> BaseEntityProtocol? {
    do {
      let rows = try connection.prepare(table.filter(id == idExpression).limit(1))
      for row in rows {
        return mapToModel(row: row)
      }
      return nil
    } catch {
      return nil
    }
  }
  
  func add(item: BaseEntityProtocol, connection: Connection) throws -> Int64 {
    return try connection.run(table.insert(getSetters(item: item)))
  }
  
  func remove(connection: Connection, idToRemove: Int) throws {
    let removeDeclaration = table.filter(idExpression == idToRemove).delete()
    try connection.run(removeDeclaration)
  }
  
  func edit(item: BaseEntityProtocol, connection: Connection) throws -> Int {
    guard let id = item.id else {
      return -1
    }
    
    let editDeclaration = table.filter(idExpression == id).update(getSetters(item: item))
    
    return try connection.run(editDeclaration)
  }
  
  // -----------
  // TO OVERRIDE
  // -----------
  
  var table: Table {
    fatalError("Must be implemented in upper class.")
  }
  
  func createTable(connection: Connection) throws {
    fatalError("Must be implemented in upper class.")
  }
  
  internal func getSetters(item: BaseEntityProtocol) -> [Setter] {
    fatalError("Must be implemented in upper class.")
  }
  
  internal func mapToModel(row: Row) -> BaseEntityProtocol {
    fatalError("Must be implemented in upper class.")
  }
  
  // -----------
  // END TO OVERRIDE
  // -----------
}


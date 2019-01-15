protocol BaseEntityProtocol {
  var id: Int? { get set }
}

class BaseEntity : BaseEntityProtocol {
  var id: Int?
  
  public init(id: Int?) {
    self.id = id
  }
}

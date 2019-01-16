enum BuildingTypeEnum: Int {
  case Forge = 0
  case EngineeringWorks = 1
  case SalvageYard = 2

  var name: String {
    switch self {
    case .Forge:
      return "Kuźnia"
    case .EngineeringWorks:
      return "Warsztat"
    case .SalvageYard:
      return "Złomowisko"
    }
  }
}

enum BuildingLevelEnum: Int {
  case Level1 = 0
  case Level2 = 1
  case Level3 = 2

  var name: String {
    switch self {
    case .Level1:
      return "Poziom 1"
    case .Level2:
      return "Poziom 2"
    case .Level3:
      return "Poziom 3"
    }
  }
}

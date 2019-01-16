enum BasementTypeEnum: Int {
  case Basement = 0
  case Barrack = 1
  case Fortress = 2

  var name: String {
    switch self {
    case .Barrack:
      return "Baraki"
    case .Basement:
      return "Piwninca"
    case .Fortress:
      return "Forteca"
    }
  }
}

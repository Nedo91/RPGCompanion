enum BuildingTypeEnum : Int {
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

enum BuildingLevelEnum: Int {
    case level = 0
    case level2 = 1
    case level3 = 2
    
    var name: String {
        switch self {
        case .level:
            return "Poziom 1"
        case .level2:
            return "Poziom 2"
        case .level3:
            return "Poziom 3"
        }
    }
}

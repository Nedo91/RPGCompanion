import Foundation

class RaceType {
    
    var staminaMultiplicator: Double!
}

class ClassType {
    
    var agilityMultiplicator: Double!
    var strengthMultiplicator: Double!
    var intelectMultiplicator: Double!
}

class Basement {
    
    var missionBonus: Int!
    
    enum BasementTypeEnum : Int {
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
}

class Buildings {
    
    enum BuildingTypeEnum : Int {
        case ForgeLevel1 = 0
        case ForgeLevel2 = 1
        case ForgeLevel3 = 2
        
        var name: String {
            switch self {
            case .ForgeLevel1:
                return "KUZNIA 1 POZIOMU"
            case .ForgeLevel2:
                return "KUZNIA 2 POZIOMU"
            case .ForgeLevel3:
                return "KUZNIA 3 POZIOMU"
            }
        }
    }
    
}

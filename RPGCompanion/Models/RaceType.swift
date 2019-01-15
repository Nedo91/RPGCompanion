import Foundation

final class RaceType: BaseEntity {
  var staminaMultiplicator: Double!

  public init(id: Int?, staminaMultiplicator: Double!) {
    super.init(id: id)
    self.staminaMultiplicator = staminaMultiplicator
  }
}

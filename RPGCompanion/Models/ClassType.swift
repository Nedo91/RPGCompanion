import Foundation

final class ClassType: BaseEntity {
  var agilityMultiplicator: Double!
  var strengthMultiplicator: Double!
  var intelectMultiplicator: Double!

  public init(id: Int?, agilityMultiplicator: Double!, strengthMultiplicator: Double!, intelectMultiplicator: Double!) {
    super.init(id: id)
    self.agilityMultiplicator = agilityMultiplicator
    self.strengthMultiplicator = strengthMultiplicator
    self.intelectMultiplicator = intelectMultiplicator
  }
}

class MissionService {
  let repo = MissionRepository()
  let connProvider = RPGCompanionDatabase()
  
  func getMissions() -> [MissionViewModel] {
    let missionsFromDb = getFromDatabase()
//    return missionsFromDb.compactMap({ (mission) -> MissionViewModel? in
//      return MissionViewModel.init(name: mission.name, reqLvl: mission., reqInt: <#T##Int#>, reqStr: <#T##Int#>, reqAgi: <#T##Int#>, experienceGained: <#T##Int#>)
//    })
    
    return [
      MissionViewModel.init(name: "Misja 1", reqLvl: 1, reqInt: 1, reqStr: 1, reqAgi: 1, experienceGained: 1),
      MissionViewModel.init(name: "Misja 2", reqLvl: 2, reqInt: 2, reqStr: 2, reqAgi: 2, experienceGained: 2),
      MissionViewModel.init(name: "Misja 3", reqLvl: 3, reqInt: 3, reqStr: 3, reqAgi: 3, experienceGained: 3),
    ]
  }
  
  private func getFromDatabase() -> [Mission] {
    guard let connection = connProvider.connection else {
      return []
    }
    
    return repo.getAllItems(connection: connection) as? [Mission] ?? []
  }
}

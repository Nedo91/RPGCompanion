import UIKit

class MissionTableViewController: UITableViewController {
  let reuseIdentifier = "MissionTableViewCell"
  
  let viewModels = [
    MissionViewModel.init(name: "Misja 1", reqLvl: 1, reqInt: 1, reqStr: 1, reqAgi: 1, experienceGained: 1),
    MissionViewModel.init(name: "Misja 2", reqLvl: 2, reqInt: 2, reqStr: 2, reqAgi: 2, experienceGained: 2),
    MissionViewModel.init(name: "Misja 3", reqLvl: 3, reqInt: 3, reqStr: 3, reqAgi: 3, experienceGained: 3),
  ]
  
  //Outlets
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModels.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MissionTableViewCell
    let item = viewModels[indexPath.row]
    
    cell.setup(model: item)

    return cell
  }

}

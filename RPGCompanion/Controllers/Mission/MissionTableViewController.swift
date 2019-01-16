import UIKit

class MissionTableViewController: UITableViewController {
  let missionService = MissionService()
  let reuseIdentifier = "MissionTableViewCell"
  
  var tableViewItems: [MissionViewModel] = []
  
  //Outlets
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableViewItems = missionService.getMissions()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewItems.count
  }


  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MissionTableViewCell
    let item = tableViewItems[indexPath.row]
    
    cell.setup(model: item)

    return cell
  }

}


import UIKit

protocol AddTableViewControllerDelegate: class {
  func add(student: String)
}

class AddTableViewController: UITableViewController {
  
  let addCell: AddTableViewCell = {
    let cell = AddTableViewCell()
    cell.accessoryType = .detailDisclosureButton
    return cell
  }()

  weak var delegate: AddTableViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = 50
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewStudent))
  }
  
  @objc func saveNewStudent(_ sender: UIBarButtonItem) {
    self.delegate?.add(student: addCell.nameTextField.text!)
    navigationController?.popViewController(animated: true)
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? "Item" : nil
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    }
    return 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return addCell
  }
  
  override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    print(#function)
  }
}

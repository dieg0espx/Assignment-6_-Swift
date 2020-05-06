
import UIKit

class ItemsTableViewController: UITableViewController, AddTableViewControllerDelegate {
    
    struct CellIdentifier {
        static let add = "AddCell"
        static let item = "ItemsCell"
    }
    
    private var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.title = "Todo Items"
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: CellIdentifier.item)
        tableView.register(AddTableViewCell.self, forCellReuseIdentifier: CellIdentifier.add)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToAddItem))
    }
    
    func add(student: String) {
        items.append(student)
        tableView.insertRows(at: [IndexPath(row: items.count - 1, section: 1)], with: .automatic)
    }
    
    @objc func goToAddItem(_ sender: UIBarButtonItem) {
        let addVC = AddTableViewController(style: .grouped)
        addVC.delegate = self
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    // MARK: - table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return items.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.item, for: indexPath) as! ItemTableViewCell
        cell.nameLabel.text = items[indexPath.row]
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor.lightGray
        
        if section == 0 {
            label.text = "High Priority"
        }
        
        if section == 1 {
            label.text = "Medium Priority"
        }
        
        if section == 2 {
            label.text = "Low Priority"
        }
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        items.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    // MARK: - table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

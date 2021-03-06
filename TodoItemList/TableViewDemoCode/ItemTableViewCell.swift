
import UIKit

class ItemTableViewCell: UITableViewCell {
  
  let nameLabel: UILabel = {
    let lb = UILabel()
    lb.translatesAutoresizingMaskIntoConstraints = false
    //lb.font = UIFont.boldSystemFont(ofSize: 20)
    return lb
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(nameLabel)
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

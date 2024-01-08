import UIKit

class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        indexOfCellLabel.text = nil
        programmLanguageLabel.text = nil
    }
    
    @IBOutlet weak var indexOfCellLabel: UILabel!
    @IBOutlet weak var programmLanguageLabel: UILabel!
    
    func configure(with name: String, index: Int) {
        indexOfCellLabel.text = String(index)
        programmLanguageLabel.text = name
    }
    
    func configure(with indexPath: IndexPath) {
        indexOfCellLabel.text = String(indexPath.row)
        programmLanguageLabel.text = String(indexPath.section)
    }
    
    func configure(with name: String) {
        indexOfCellLabel.text = name
    }
}

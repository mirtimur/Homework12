import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(section: section) else { return 0 }
        
        return sectionType.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(section: indexPath.section),
              let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        switch sectionType {
        case .first:
            guard sectionType.dataSource.count > indexPath.row else { return UITableViewCell() }
                    
            cell.configure(with: sectionType.dataSource[indexPath.row], index: indexPath.row)
    
            return cell
        case .second:
            cell.configure(with: indexPath)
            
            return cell
        case .third:
            guard sectionType.dataSource.count > indexPath.row else { return UITableViewCell() }
                    
            cell.configure(with: sectionType.dataSource[indexPath.row])
            
            return cell
        }
    }
}

extension ViewController {
    enum SectionType: Int, CaseIterable {
        case first
        case second
        case third
        
        init?(section: Int) {
            guard let type = Self.allCases.first(where: { $0.rawValue == section }) else { return nil }
            
            self = type
        }
        
        var numberOfItems: Int {
            switch self {
            case .first:
                dataSource.count
            case .second:
                10
            case .third:
                dataSource.count
            }
        }
        
        var dataSource: [String] {
            switch self {
            case .first:
                let firstDataSource = ["Swift",
                                       "Python",
                                       "JavaScript",
                                       "Java",
                                       "PHP",
                                       "С",
                                       "C++",
                                       "Go",
                                       "C#",
                                       "Kotlin",
                                       "Node.js",
                                       "ASP",
                                       "Scratch",
                                       "Rust",
                                       "SQL",
                                       "Objective C",
                                       "Delphi",
                                       "Visual Basic",
                                       "Perl",
                                       "OpenScript"]
                
                return firstDataSource
            case .second:
                return []
            case .third:
                let thirdDataSource = ["Swift",
                                       "Python",
                                       "JavaScript",
                                       "Java",
                                       "PHP",
                                       "С",
                                       "C++",
                                       "Go",
                                       "C#",
                                       "Kotlin"]
                
                return thirdDataSource
            }
        }
    }
}

import UIKit

class NonContentViewController: UIViewController {

    private let array: [Int] = {
        (0...100).reduce([]) { $0 + [$1] }
    }()

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(NonContentTableViewCell.self)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
}

extension NonContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension NonContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(of: NonContentTableViewCell.self, for: indexPath)
        cell.label.text = "Row: \(array[indexPath.row])"

        if indexPath.row % 2 == 0 {
            cell.label.textColor = .white
            cell.contentView.backgroundColor = .gray
        }
        
        return cell
    }
}

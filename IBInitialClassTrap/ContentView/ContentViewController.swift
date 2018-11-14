import UIKit

class ContentViewController: UIViewController {

    private let array: [Int] = {
        (0...100).reduce([]) { $0 + [$1] }
    }()

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.registerCell(ContentTableViewCell.self)
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

}

extension ContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(of: ContentTableViewCell.self, for: indexPath)
        cell.label.text = "Row: \(array[indexPath.row])"

        if indexPath.row % 2 == 0 {
            cell.label.textColor = .white
            cell.contentView.backgroundColor = .gray
        }

        return cell
    }
}

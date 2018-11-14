import UIKit

extension UITableView {
    func registerCell<T: Nibable & Reusable>(_ cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }

    func dequeueReusableCell<T: Nibable & Reusable>(of type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
    }
}

import Foundation
import UIKit

protocol Nibable: NSObjectProtocol {
    static var nib: UINib { get }
    static var nibName: String { get }
}

extension Nibable {
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

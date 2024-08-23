//
//  Created by Łukasz Osiennik on 22/08/2024.
//

public protocol Weakly {

    associatedtype Object: AnyObject

    var object: Object? { get }
}

extension Weakly {

    func isExist() -> Bool {
        object != nil
    }
}

public final class Weak<Object: AnyObject>: Weakly {

    public private(set) weak var object: Object?

    public init(object: Object) {
        self.object = object
    }
}

extension Array where Element: Weakly, Element.Object: AnyObject {

    mutating func cleanUp() {
        self = self.filter {
            $0.isExist()
        }
    }
}

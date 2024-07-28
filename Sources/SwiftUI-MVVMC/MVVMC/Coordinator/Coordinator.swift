//
//  Created by Łukasz Osiennik on 28/07/2024.
//

class Coordinator: CoordinatorProtocol {
    
    weak private(set) var parent: Coordinator?
    
    init(parent: Coordinator?) {
        self.parent = parent
    }
}

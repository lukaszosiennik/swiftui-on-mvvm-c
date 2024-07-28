//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Foundation

protocol CoordinatorProtocol: AnyObject, ObservableObject {
    
    associatedtype Coordinator: CoordinatorProtocol
    
    var parent: Coordinator? { get }
}

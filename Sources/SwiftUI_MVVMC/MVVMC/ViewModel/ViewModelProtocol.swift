//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Foundation

public protocol ViewModelProtocol: AnyObject, ObservableObject {
    
    associatedtype Coordinator: CoordinatorProtocol
    
    var coordinator: Coordinator { get set }
}

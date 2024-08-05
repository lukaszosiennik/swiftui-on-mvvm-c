//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Foundation

public protocol Coordinating: AnyObject, ObservableObject {
    
    associatedtype Coordinator: Coordinating
    
    var parent: Coordinator? { get }
}

extension Coordinating {
    
    var levelType: CoordinatorLevelType {
        return parent == nil ? .root : .subtree
    }
    
    var type: CoordinatorType {
        switch self {
        case is any RootCoordinating:
            return .root
        case is any TabBarRouteID:
            return .tabBar
        case is any NavigationStackCoordinating:
            return .navigationStack
        case is any NavigationPathCoordinating:
            return .navigationPath
        case is any ModalCoordinating:
            return .modal
        default:
            return .raw
        }
    }
}

//
//  Created by Łukasz Osiennik on 01/08/2024.
//

import SwiftUI

public protocol NavigationCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype RootView: SwiftUI.View
    associatedtype DestinationView: SwiftUI.View
    
    associatedtype RouteID: NavigationRouteID
    
    var pathRaw: NavigationPath { get set }
    var pathBinding: Binding<NavigationPath> { get }
    
    func goToRoot() -> RootView
    func goTo(routeID: RouteID) -> DestinationView
}

extension NavigationCoordinatorProtocol {
    
    public var pathBinding: Binding<NavigationPath> {
        .init(get: { [weak self] in
            self?.pathRaw ?? .init()
        }, set: { [weak self] path in
            self?.pathRaw = path
        })
    }
}

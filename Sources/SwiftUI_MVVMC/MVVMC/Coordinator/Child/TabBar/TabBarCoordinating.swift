//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI

public protocol TabBarCoordinating: Coordinating {
    
    associatedtype View: SwiftUI.View
    
    associatedtype RouteID: TabBarRouteID
    
    func goTo(routeID: RouteID) -> View
}

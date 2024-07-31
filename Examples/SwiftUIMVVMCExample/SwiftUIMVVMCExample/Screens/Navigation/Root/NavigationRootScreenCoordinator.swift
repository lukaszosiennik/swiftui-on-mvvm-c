//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationRootScreenCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    typealias NavigationRouteID = NavigationRootScreenNavigationRouteID
    
    func goTo(routeID: NavigationRouteID) -> View
}

final class NavigationRootScreenCoordinator: Coordinator, NavigationRootScreenCoordinatorProtocol {
    
    func goTo(routeID: NavigationRouteID) -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenViewModel(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(for: routeID)
        )
    }
}

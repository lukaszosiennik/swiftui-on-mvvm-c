//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationScreenCoordinatorProtocol: NavigationCoordinatorProtocol {}

final class NavigationScreenCoordinator: Coordinator, NavigationScreenCoordinatorProtocol {

    @Published
    var pathRaw: NavigationPath = .init()
    
    func goToRoot() -> some View {
        NavigationRootScreenView(
            viewModel: NavigationRootScreenViewModel(
                coordinator: NavigationRootScreenCoordinator(parent: self)
            )
        )
    }
    
    func goTo(routeID: NavigationScreenNavigationRouteID) -> some View {
        Group {
            switch routeID {
            case .first:
                goToTemplateScreen(with: routeID)
            case .second:
                goToNavigationChildScreen()
            case .third:
                goToRootRouteIDsScreen()
            }
        }
    }
    
    func goToTemplateScreen(with routeID: RouteID) -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenViewModel(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(for: routeID)
        )
    }
    
    func goToNavigationChildScreen() -> some View {
        NavigationChildScreenView(
            viewModel: NavigationChildScreenViewModel(
                coordinator: NavigationChildScreenCoordinator(parent: self)
            )
        )
    }
    
    func goToRootRouteIDsScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: RootRouteIDsScreenViewModel(
                coordinator: RootRouteIDsScreenCoordinator(
                    parent: self
                )
            ),
            params: .init(
                excludedRouteID: .home
            )
        )
    }
}

//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationScreenCoordinating: NavigationStackCoordinating
where RouteID == NavigationScreenNavigationRouteID {}

final class NavigationScreenCoordinator: Coordinator, NavigationScreenCoordinating {

    @Published
    var pathRaw: NavigationPath = .init()
    
    func goToRoot() -> some View {
        NavigationRootScreenView(
            viewModel: NavigationRootScreenVM(
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
            case .fourth:
                goToModalsScreen()
            }
        }
    }
    
    func goToTemplateScreen(with routeID: RouteID) -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenVM(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(forNavigation: routeID)
        )
    }
    
    func goToNavigationChildScreen() -> some View {
        NavigationChildScreenView(
            viewModel: NavigationChildScreenVM(
                coordinator: NavigationChildScreenCoordinator(parent: self)
            ),
            params: .init(
                number: 0
            )
        )
    }
    
    func goToRootRouteIDsScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: RootRouteIDsScreenVM(
                coordinator: RootRouteIDsScreenCoordinator(
                    parent: self
                )
            ),
            params: .init(
                excludedRouteID: .home
            )
        )
    }
    
    func goToModalsScreen() -> some View {
        ModalsScreenView(
            viewModel: ModalsScreenVM(
                coordinator: ModalsScreenCoordinator(parent: self)
            )
        )
    }
}

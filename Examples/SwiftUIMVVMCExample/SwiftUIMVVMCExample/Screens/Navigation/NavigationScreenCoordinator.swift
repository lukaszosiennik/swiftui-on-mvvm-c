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
        NavigationChildScreenView(
            viewModel: NavigationChildScreenVM(
                coordinator: NavigationChildScreenCoordinator(parent: self)
            ),
            params: .init(
                number: 0
            )
        )
    }
    
    func goTo(routeID: NavigationScreenNavigationRouteID) -> some View {
        Group {
            switch routeID {
            case .path:
                goToNavigationChildScreen()
            case .link:
                goToTemplateScreen(with: routeID)
            }
        }
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
    
    func goToTemplateScreen(with routeID: RouteID) -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenVM(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(forNavigation: routeID)
        )
    }
}

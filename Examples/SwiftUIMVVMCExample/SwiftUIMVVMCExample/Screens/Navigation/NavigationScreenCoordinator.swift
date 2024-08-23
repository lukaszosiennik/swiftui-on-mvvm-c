//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationScreenCoordinating: NavigationStackCoordinating
where RouteID == NavigationScreenNavigationRouteID {}

final class NavigationScreenCoordinator: Coordinator, NavigationScreenCoordinating {

    private weak var rootScreenVM: NavigationChildScreenVM<NavigationChildScreenCoordinator>?
    private weak var childScreenVM: NavigationChildScreenVM<NavigationChildScreenCoordinator>?
    private weak var templateScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?

    @Published
    var pathRaw: NavigationPath = .init()

    func goToNavigationRoot() -> some View {
        NavigationChildScreenView(
            viewModel: viewModelProvider.perform(&rootScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(
                number: 0
            )
        )
    }

    func goToNavigation(routeID: NavigationScreenNavigationRouteID) -> some View {
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
            viewModel: viewModelProvider.perform(&childScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(
                number: pathRaw.count
            )
        )
    }

    func goToTemplateScreen(with routeID: RouteID) -> some View {
        TemplateScreenView(
            viewModel: viewModelProvider.perform(&templateScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forNavigation: routeID)
        )
    }
}

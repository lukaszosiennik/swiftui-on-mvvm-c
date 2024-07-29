//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    func goToCurrentRoute() -> View
}
    
final class AppCoordinator: RootCoordinator<RootRouteManager<AppCoordinatorRoute>>, AppCoordinatorProtocol {

    init(rootRouteManager: RootRouteManager<AppCoordinatorRoute> = .init(currentRouteID: .launch)) {
        super.init(parent: nil, routeManager: rootRouteManager)
    }
    
    func goToCurrentRoute() -> some View {
        goTo(route: routeManager.currentRouteID)
    }

    func goTo(route: AppCoordinatorRoute) -> some View {
        Group {
            switch route {
            case .launch:
                goToLaunchScreen()
            case .home:
                goToHomeScreen()
            }
        }
    }
    
    func goToLaunchScreen() -> some View {
        LaunchScreenView(
            viewModel: LaunchScreenViewModel(
                coordinator: LaunchScreenCoordinator(
                    parent: self
                )
            )
        )
    }
    
    func goToHomeScreen() -> some View {
        HomeScreenView(
            viewModel: HomeScreenViewModel(
                coordinator: HomeScreenCoordinator(
                    parent: self
                )
            )
        )
    }
}

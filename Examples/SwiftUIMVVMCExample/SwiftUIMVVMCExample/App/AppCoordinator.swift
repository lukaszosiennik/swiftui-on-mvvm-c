//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    func goToCurrentRoute() -> View
}
    
final class AppCoordinator: RootCoordinator<RootRouteManager<AppRootRouteID>>, AppCoordinatorProtocol {

    init(rootRouteManager: RootRouteManager<AppRootRouteID> = .init(currentRouteID: .launch)) {
        super.init(parent: nil, routeManager: rootRouteManager)
    }
    
    func goToCurrentRoute() -> some View {
        goTo(route: routeManager.currentRouteID)
    }

    func goTo(route: AppRootRouteID) -> some View {
        Group {
            switch route {
            case .launch:
                goToLaunchScreen()
            case .rootRouteIDs:
                goToRootRouteIDsScreen()
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
    
    func goToRootRouteIDsScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: RootRouteIDsScreenViewModel(
                coordinator: RootRouteIDsScreenCoordinator(
                    parent: self
                )
            ), 
            params: .init(
                excludedRouteID: .rootRouteIDs
            )
        )
    }
    
    func goToHomeScreen() -> some View {
        NavigationScreenView(
            viewModel: NavigationScreenViewModel(
                coordinator: NavigationScreenCoordinator(
                    parent: self
                )
            )
        )
    }
}

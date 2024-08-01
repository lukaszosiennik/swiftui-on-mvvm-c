//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol AppCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    func goToCurrentRoute() -> View
}
    
final class AppCoordinator: RootCoordinator<RootRouteIDManager<AppRootRouteID>>, AppCoordinatorProtocol {

    init(rootRouteIDManager: RootRouteIDManager = .init(currentRouteID: .launch)) {
        super.init(parent: nil, routeIDManager: rootRouteIDManager)
    }
    
    func goToCurrentRoute() -> some View {
        goTo(routeID: routeIDManager.currentRouteID)
    }

    func goTo(routeID: AppRootRouteID) -> some View {
        Group {
            switch routeID {
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

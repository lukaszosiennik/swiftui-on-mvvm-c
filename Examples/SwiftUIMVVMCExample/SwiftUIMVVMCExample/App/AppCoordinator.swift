//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol AppCoordinating: RootCoordinating {

    associatedtype View: SwiftUI.View

    func goToCurrentRoute() -> View
}

final class AppCoordinator: TransmittingRootCoordinator<RootRouteIDManager<AppRootRouteID>>, AppCoordinating {

    private weak var launchScreenVM: LaunchScreenVM<LaunchScreenCoordinator>?
    private weak var rootRouteIDsScreenVM: RootRouteIDsScreenVM<RootRouteIDsScreenCoordinator>?
    private weak var tabBarScreenVM: TabBarScreenVM<TabBarScreenCoordinator>?
    private weak var navigationScreenVM: NavigationScreenVM<NavigationScreenCoordinator>?
    private weak var modalsScreenVM: ModalsScreenVM<ModalsScreenCoordinator>?

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
            case .tabBar:
                goToTabBarScreen()
            case .navigationStack:
                goToNavigationScreen()
            case .modals:
                goToModalsScreen()
            }
        }
    }

    func goToLaunchScreen() -> some View {
        LaunchScreenView(
            viewModel: viewModelProvider.perform(&launchScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }

    func goToRootRouteIDsScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: viewModelProvider.perform(&rootRouteIDsScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(
                excludedRouteID: .rootRouteIDs
            )
        )
    }

    func goToTabBarScreen() -> some View {
        TabBarScreenView(
            viewModel: viewModelProvider.perform(&tabBarScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }

    func goToNavigationScreen() -> some View {
        NavigationScreenView(
            viewModel: viewModelProvider.perform(&navigationScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }

    func goToModalsScreen() -> some View {
        ModalsScreenView(
            viewModel: viewModelProvider.perform(&modalsScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }
}

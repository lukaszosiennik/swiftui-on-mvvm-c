//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol TabBarScreenCoordinating: TabBarCoordinating
where RouteID == TabBar.RouteID {}

final class TabBarScreenCoordinator: Coordinator, TabBarScreenCoordinating {
    
    func goTo(routeID: TabBar.RouteID) -> some View {
        Group {
            switch routeID {
            case .first:
                goToFirstScreen()
            case .second:
                goToSecondScreen()
            case .third:
                goToThirdScreen()
            }
        }
    }
    
    func goToFirstScreen() -> some View {
        RootRouteIDsScreenView(
            viewModel: RootRouteIDsScreenVM(
                coordinator: RootRouteIDsScreenCoordinator(parent: self)
            ),
            params: .init(
                excludedRouteID: .rootRouteIDs
            )
        )
    }
    
    func goToSecondScreen() -> some View {
        NavigationScreenView(
            viewModel: NavigationScreenVM(
                coordinator: NavigationScreenCoordinator(parent: self)
            )
        )
    }
    
    func goToThirdScreen() -> some View {
        ModalsScreenView(
            viewModel: ModalsScreenVM(
                coordinator: ModalsScreenCoordinator(parent: self)
            )
        )
    }
}

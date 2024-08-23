//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol TabBarScreenCoordinating: TabBarCoordinating
where RouteID == TabBar.RouteID {

    @discardableResult
    func goToRootRouteIDsScreen() -> Bool
}

final class TabBarScreenCoordinator: Coordinator, TabBarScreenCoordinating {

    private weak var firstScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?
    private weak var secondScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?
    private weak var thirdScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?

    func goToTabBar(routeID: TabBar.RouteID) -> some View {
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
        TemplateScreenView(
            viewModel: viewModelProvider.perform(&firstScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forTabBar: .first)
        )
    }

    func goToSecondScreen() -> some View {
        TemplateScreenView(
            viewModel: viewModelProvider.perform(&secondScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forTabBar: .second)
        )
    }

    func goToThirdScreen() -> some View {
        TemplateScreenView(
            viewModel: viewModelProvider.perform(&thirdScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forTabBar: .third)
        )
    }

    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}

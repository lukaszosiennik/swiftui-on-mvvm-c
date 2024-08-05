//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol TabBarScreenCoordinating: TabBarCoordinating
where RouteID == TabBar.RouteID {}

final class TabBarScreenCoordinator: Coordinator, TabBarScreenCoordinating {
    
    func goTo(routeID: TabBar.RouteID) -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenVM(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(forTabBar: routeID)
        )
    }
}

//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol NavigationScreenCoordinatorProtocol: CoordinatorProtocol {
    
    associatedtype View: SwiftUI.View
    
    func coordToRoot() -> View
}

final class NavigationScreenCoordinator: Coordinator, NavigationScreenCoordinatorProtocol {
    
    func coordToRoot() -> some View {
        NavigationRootScreenView(
            viewModel: NavigationRootScreenViewModel(
                coordinator: NavigationRootScreenCoordinator(parent: self)
            )
        )
    }
}

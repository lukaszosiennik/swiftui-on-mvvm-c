//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationRootScreenViewModelProtocol: ViewModelProtocol
where Coordinator: NavigationRootScreenCoordinatorProtocol {}

final class NavigationRootScreenViewModel<
    Coordinator: NavigationRootScreenCoordinatorProtocol
>: ViewModel<Coordinator>, NavigationRootScreenViewModelProtocol {}

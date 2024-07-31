//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationScreenViewModelProtocol: ViewModelProtocol
where Coordinator: NavigationScreenCoordinatorProtocol {}

final class NavigationScreenViewModel<
    Coordinator: NavigationScreenCoordinatorProtocol
>: ViewModel<Coordinator>, NavigationScreenViewModelProtocol {}

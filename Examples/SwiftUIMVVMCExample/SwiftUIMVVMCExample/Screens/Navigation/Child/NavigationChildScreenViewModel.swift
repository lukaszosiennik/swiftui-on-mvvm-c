//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationChildScreenViewModelProtocol: ViewModelProtocol
where Coordinator: NavigationChildScreenCoordinatorProtocol {}

final class NavigationChildScreenViewModel<
    Coordinator: NavigationChildScreenCoordinatorProtocol
>: ViewModel<Coordinator>, NavigationChildScreenViewModelProtocol {}

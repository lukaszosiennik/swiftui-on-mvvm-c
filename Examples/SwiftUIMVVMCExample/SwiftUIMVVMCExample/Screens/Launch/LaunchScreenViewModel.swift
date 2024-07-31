//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol LaunchScreenViewModelProtocol: ViewModelProtocol
where Coordinator: LaunchScreenCoordinatorProtocol {}

final class LaunchScreenViewModel<
    Coordinator: LaunchScreenCoordinatorProtocol
>: ViewModel<Coordinator>, LaunchScreenViewModelProtocol {}

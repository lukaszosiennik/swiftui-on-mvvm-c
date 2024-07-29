//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol HomeScreenViewModelProtocol: ViewModelProtocol
where Coordinator: HomeScreenCoordinatorProtocol {}

final class HomeScreenViewModel<
    CoordinatorType: HomeScreenCoordinatorProtocol
>: ViewModel<CoordinatorType>, HomeScreenViewModelProtocol {}

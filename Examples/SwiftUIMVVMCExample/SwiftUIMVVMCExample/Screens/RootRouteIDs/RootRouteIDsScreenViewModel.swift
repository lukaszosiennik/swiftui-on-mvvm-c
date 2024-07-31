//
//  Created by Łukasz Osiennik on 22/06/2024.
//

import SwiftUI_MVVMC

protocol RootRouteIDsScreenViewModelProtocol: ViewModelProtocol
where Coordinator: RootRouteIDsScreenCoordinatorProtocol {}

final class RootRouteIDsScreenViewModel<
    Coordinator: RootRouteIDsScreenCoordinatorProtocol
>: ViewModel<Coordinator>, RootRouteIDsScreenViewModelProtocol {}

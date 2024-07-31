//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol EmptyScreenViewModelProtocol: ViewModelProtocol
where Coordinator: EmptyScreenCoordinatorProtocol {}

final class EmptyScreenViewModel<
    Coordinator: EmptyScreenCoordinatorProtocol
>: ViewModel<Coordinator>, EmptyScreenViewModelProtocol {}

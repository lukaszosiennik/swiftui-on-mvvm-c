//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol EmptyScreenViewModel: ViewModel
where Coordinator: EmptyScreenCoordinating {}

final class EmptyScreenVM<
    Coordinator: EmptyScreenCoordinating
>: TransmittingVM<Coordinator>, EmptyScreenViewModel {}

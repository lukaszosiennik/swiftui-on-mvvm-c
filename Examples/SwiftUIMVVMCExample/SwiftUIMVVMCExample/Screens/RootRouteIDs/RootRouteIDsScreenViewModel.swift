//
//  Created by Łukasz Osiennik on 22/06/2024.
//

import SwiftUI_MVVMC

protocol RootRouteIDsScreenViewModel: ViewModel
where Coordinator: RootRouteIDsScreenCoordinating {}

final class RootRouteIDsScreenVM<
    Coordinator: RootRouteIDsScreenCoordinating
>: TransmittingVM<Coordinator>, RootRouteIDsScreenViewModel {}

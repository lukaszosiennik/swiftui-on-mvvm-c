//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationRootScreenViewModel: ViewModel
where Coordinator: NavigationRootScreenCoordinating {}

final class NavigationRootScreenVM<
    Coordinator: NavigationRootScreenCoordinating
>: TransmittingVM<Coordinator>, NavigationRootScreenViewModel {}

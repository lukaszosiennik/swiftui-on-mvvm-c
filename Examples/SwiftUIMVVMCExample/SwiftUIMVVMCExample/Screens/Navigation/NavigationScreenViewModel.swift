//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationScreenViewModel: ViewModel
where Coordinator: NavigationScreenCoordinating {}

final class NavigationScreenVM<
    Coordinator: NavigationScreenCoordinating
>: TransmittingVM<Coordinator>, NavigationScreenViewModel {}

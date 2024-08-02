//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol NavigationChildScreenViewModel: ViewModel
where Coordinator: NavigationChildScreenCoordinating {}

final class NavigationChildScreenVM<
    Coordinator: NavigationChildScreenCoordinating
>: TransmittingVM<Coordinator>, NavigationChildScreenViewModel {}

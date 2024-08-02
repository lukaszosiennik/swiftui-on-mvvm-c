//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol LaunchScreenViewModel: ViewModel
where Coordinator: LaunchScreenCoordinating {}

final class LaunchScreenVM<
    Coordinator: LaunchScreenCoordinating
>: TransmittingVM<Coordinator>, LaunchScreenViewModel {}

//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

protocol AppViewModel: ViewModel
where Coordinator: AppCoordinating {}

final class AppVM<
    Coordinator: AppCoordinating
>: TransmittingVM<Coordinator>, AppViewModel {}

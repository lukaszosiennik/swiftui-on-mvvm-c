//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI_MVVMC

protocol AlertActionsScreenViewModel: ViewModel
where Coordinator: AlertActionsScreenCoordinating {}

final class AlertActionsScreenVM<
    Coordinator: AlertActionsScreenCoordinating
>: TransmittingVM<Coordinator>, AlertActionsScreenViewModel {}

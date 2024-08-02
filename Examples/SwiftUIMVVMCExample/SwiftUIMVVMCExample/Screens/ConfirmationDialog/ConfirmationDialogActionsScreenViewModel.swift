//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI_MVVMC

protocol ConfirmationDialogActionsScreenViewModel: ViewModel
where Coordinator: ConfirmationDialogActionsScreenCoordinating {}

final class ConfirmationDialogActionsScreenVM<
    Coordinator: ConfirmationDialogActionsScreenCoordinating
>: TransmittingVM<Coordinator>, ConfirmationDialogActionsScreenViewModel {}

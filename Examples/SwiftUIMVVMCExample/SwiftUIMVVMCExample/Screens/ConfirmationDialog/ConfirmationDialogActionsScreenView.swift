//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI

struct ConfirmationDialogActionsScreenView<ViewModel: ConfirmationDialogActionsScreenViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Button("Option 1") {}
        Button("Option 2") {}
        Button("Option 3") {}
        Button("Cancel", role: .cancel) {}
    }
}

#Preview {
    ConfirmationDialogActionsScreenView(
        viewModel: ConfirmationDialogActionsScreenVM(
            coordinator: ConfirmationDialogActionsScreenCoordinator(parent: nil)
        )
    )
}

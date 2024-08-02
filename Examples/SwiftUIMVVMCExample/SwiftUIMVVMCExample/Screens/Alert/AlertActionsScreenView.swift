//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI

struct AlertActionsScreenView<ViewModel: AlertActionsScreenViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Button("OK", role: .cancel) {}
    }
}

#Preview {
    AlertActionsScreenView(
        viewModel: AlertActionsScreenVM(
            coordinator: AlertActionsScreenCoordinator(parent: nil)
        )
    )
}

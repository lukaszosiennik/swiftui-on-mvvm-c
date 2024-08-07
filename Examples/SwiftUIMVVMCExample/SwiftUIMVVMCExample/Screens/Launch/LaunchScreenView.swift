//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

struct LaunchScreenView<ViewModel: LaunchScreenViewModel>: View {

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        Text("Launch Screen")
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                viewModel.coordinator.goToRootRouteIDsScreen()
            }
        }
    }
}

#Preview {
    LaunchScreenView(
        viewModel: LaunchScreenVM(
            coordinator: LaunchScreenCoordinator(parent: nil)
        )
    )
}

//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

struct LaunchScreenView<ViewModel: LaunchScreenViewModelProtocol>: View {

    @ObservedObject 
    var viewModel: ViewModel

    var body: some View {
        Text("Launch Screen")
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                viewModel.coordinator.goToHomeScreen()
            }
        }
    }
}

#Preview {
    LaunchScreenView(
        viewModel: LaunchScreenViewModel(
            coordinator: LaunchScreenCoordinator(parent: nil)
        )
    )
}

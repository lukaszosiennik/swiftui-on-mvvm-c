//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationScreenView<ViewModel: NavigationScreenViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack(path: $viewModel.coordinator.pathRaw) {
            viewModel.coordinator.goToRoot()
            .navigationDestination(for: ViewModel.Coordinator.RouteID.self) { routeID in
                viewModel.coordinator.goTo(routeID: routeID)
            }
        }
    }
}

#Preview {
    NavigationScreenView(
        viewModel: NavigationScreenViewModel(
            coordinator: NavigationScreenCoordinator(parent: nil)
        )
    )
}

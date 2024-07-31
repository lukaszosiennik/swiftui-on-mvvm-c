//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationRootScreenView<ViewModel: NavigationRootScreenViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("NavigationRoot Screen")
            
            Spacer().frame(height: 20)
            
            NavigationLink(value: ViewModel.Coordinator.NavigationRouteID.first) {
                Text("GoTo First")
            }
            NavigationLink(value: ViewModel.Coordinator.NavigationRouteID.second) {
                Text("GoTo Second")
            }
            NavigationLink(value: ViewModel.Coordinator.NavigationRouteID.third) {
                Text("GoTo Third")
            }
            .navigationDestination(for: ViewModel.Coordinator.NavigationRouteID.self) { routeID in
                viewModel.coordinator.goTo(routeID: routeID)
            }
        }
    }
}

#Preview {
    NavigationRootScreenView(
        viewModel: NavigationRootScreenViewModel(
            coordinator: NavigationRootScreenCoordinator(parent: nil)
        )
    )
}

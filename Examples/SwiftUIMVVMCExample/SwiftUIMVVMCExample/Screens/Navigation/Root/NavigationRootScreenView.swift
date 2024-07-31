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
            
            NavigationLink(value: ViewModel.Coordinator.RouteID.first) {
                Text("GoTo First")
            }
            NavigationLink(value: ViewModel.Coordinator.RouteID.second) {
                Text("GoTo Second")
            }
            NavigationLink(value: ViewModel.Coordinator.RouteID.third) {
                Text("GoTo Third")
            }
            .navigationDestination(for: ViewModel.Coordinator.RouteID.self) { routeID in
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

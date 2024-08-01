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
            
            Button("Button GoTo First") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.first)
            }
            Button("Button GoTo Second") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.second)
            }
            Button("Button GoTo RootRouteIDs") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.third)
            }
            
            Spacer().frame(height: 20)
            
            NavigationLink(value: ViewModel.Coordinator.RouteID.first) {
                Text("Link GoTo First")
            }
            NavigationLink(value: ViewModel.Coordinator.RouteID.second) {
                Text("Link GoTo Second")
            }
            NavigationLink(value: ViewModel.Coordinator.RouteID.third) {
                Text("Link GoTo RootRouteIDs")
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

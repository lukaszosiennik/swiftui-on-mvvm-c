//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationRootScreenView<ViewModel: NavigationRootScreenViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("NavigationRoot Screen")
            
            Spacer().frame(height: 20)
            
            Button("Button GoTo Template") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.first)
            }
            Button("Button GoTo NavigationChild") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.second)
            }
            Button("Button GoTo RootRouteIDs") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.third)
            }
            
            Spacer().frame(height: 20)
            
            NavigationLink(value: ViewModel.Coordinator.RouteID.fourth) {
                Text("Link GoTo Modals")
            }
        }
    }
}

#Preview {
    NavigationRootScreenView(
        viewModel: NavigationRootScreenVM(
            coordinator: NavigationRootScreenCoordinator(parent: nil)
        )
    )
}

//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationChildScreenView<ViewModel: NavigationChildScreenViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("NavigationChild Screen")
            
            Spacer().frame(height: 20)
            
            Button("Button GoTo forward") {
                viewModel.coordinator.addToPath(routeID: ViewModel.Coordinator.RouteID.second)
            }
            Button("Button GoTo backward") {
                viewModel.coordinator.removeFromPath(segmentCount: 1)
            }
            Button("Button clear path") {
                viewModel.coordinator.clearPath()
            }
        }
    }
}

#Preview {
    NavigationChildScreenView(
        viewModel: NavigationChildScreenVM(
            coordinator: NavigationChildScreenCoordinator(parent: nil)
        )
    )
}

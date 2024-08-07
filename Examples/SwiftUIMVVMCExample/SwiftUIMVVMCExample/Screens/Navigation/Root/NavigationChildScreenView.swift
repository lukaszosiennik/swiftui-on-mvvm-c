//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationChildScreenView<ViewModel: NavigationChildScreenViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    let params: Params

    var body: some View {
        VStack {
            Text("NavigationChild Screen \(params.number)")

            Spacer().frame(height: 20)

            Button("Button GoTo path forward") {
                viewModel.coordinator.navigationPathAppend(ViewModel.Coordinator.RouteID.path)
            }
            Button("Button GoTo path backward") {
                viewModel.coordinator.navigationPathRemoveLast(1)
            }
            Button("Button GoTo path clear") {
                viewModel.coordinator.navigationPathClear()
            }

            Spacer().frame(height: 20)

            NavigationLink(value: ViewModel.Coordinator.RouteID.link) {
                Text("Link GoTo forward")
            }

            Spacer().frame(height: 20)

            Button("GoTo RootRouteIDs Screen") {
                viewModel.coordinator.goToRootRouteIDsScreen()
            }
        }
    }
}

#Preview {
    NavigationChildScreenView(
        viewModel: NavigationChildScreenVM(
            coordinator: NavigationChildScreenCoordinator(parent: nil)
        ),
        params: .init(
            number: 0
        )
    )
}

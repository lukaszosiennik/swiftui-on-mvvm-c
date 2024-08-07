//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI

struct ModalsScreenView<ViewModel: ModalsScreenViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("Modals Screen")

            Spacer().frame(height: 20)

            Button("GoTo Modal Sheet") {
                viewModel.coordinator.isPresented(routeID: .sheet).wrappedValue.toggle()
            }
            .sheet(isPresented: viewModel.coordinator.isPresented(routeID: .sheet)) {
                viewModel.coordinator.goToModal(routeID: .sheet)
            }

            Button("GoTo Modal FullScreenCover") {
                viewModel.coordinator.isPresented(routeID: .fullScreenCover).wrappedValue.toggle()
            }
            .fullScreenCover(isPresented: viewModel.coordinator.isPresented(routeID: .fullScreenCover)) {
                viewModel.coordinator.goToModal(routeID: .fullScreenCover)
            }

            Button("GoTo Modal Alert") {
                viewModel.coordinator.isPresented(routeID: .alert).wrappedValue.toggle()
            }
            .alert("Alert Screen", isPresented: viewModel.coordinator.isPresented(routeID: .alert)) {
                viewModel.coordinator.goToModal(routeID: .alert)
            }

            Button("GoTo Modal ConfirmationDialog") {
                viewModel.coordinator.isPresented(routeID: .confirmationDialog).wrappedValue.toggle()
            }
            .confirmationDialog("ConfirmationDialog Screen", isPresented: viewModel.coordinator.isPresented(routeID: .confirmationDialog)) {
                viewModel.coordinator.goToModal(routeID: .confirmationDialog)
            } message: {
                Text("ConfirmationDialog Message")
            }

            Spacer().frame(height: 20)

            Button("GoTo RootRouteIDs Screen") {
                viewModel.coordinator.goToRootRouteIDsScreen()
            }
        }
    }
}

#Preview {
    ModalsScreenView(
        viewModel: ModalsScreenVM(
            coordinator: ModalsScreenCoordinator(parent: nil)
        )
    )
}

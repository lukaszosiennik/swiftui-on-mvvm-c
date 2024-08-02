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
                viewModel.coordinator.isSheetPresented.toggle()
            }
            .sheet(isPresented: $viewModel.coordinator.isSheetPresented) {
                viewModel.coordinator.goTo(routeID: .sheet)
            }
            Button("GoTo Modal FullScreenCover") {
                viewModel.coordinator.isFullScreenCoverPresented.toggle()
            }
            .fullScreenCover(isPresented: $viewModel.coordinator.isFullScreenCoverPresented) {
                viewModel.coordinator.goTo(routeID: .fullScreenCover)
            }
            Button("GoTo Modal Alert") {
                viewModel.coordinator.isAlertPresented.toggle()
            }
            .alert("Alert Screen", isPresented: $viewModel.coordinator.isAlertPresented) {
                viewModel.coordinator.goTo(routeID: .alert)
            }
            Button("GoTo Modal ConfirmationDialog") {
                viewModel.coordinator.isConfirmationDialogPresented.toggle()
            }
            .confirmationDialog("ConfirmationDialog Screen", isPresented: $viewModel.coordinator.isConfirmationDialogPresented) {
                viewModel.coordinator.goTo(routeID: .confirmationDialog)
            } message: {
                Text("ConfirmationDialog Message")
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

//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol ModalsScreenCoordinating: ModalCoordinating 
where RouteID == ModalsScreenModalRouteID {
    
    @discardableResult
    func goToRootRouteIDsScreen() -> Bool
}

final class ModalsScreenCoordinator: Coordinator, ModalsScreenCoordinating {
    
    @Published 
    var isSheetPresented: Bool = false
    @Published 
    var isFullScreenCoverPresented: Bool = false
    @Published 
    var isAlertPresented: Bool = false
    @Published 
    var isConfirmationDialogPresented: Bool = false
    
    func isPresented(routeID: ModalsScreenModalRouteID) -> Binding<Bool> {
        switch routeID {
        case .sheet:
            isPresented(keyPath: \Self.isSheetPresented)
        case .fullScreenCover:
            isPresented(keyPath: \Self.isFullScreenCoverPresented)
        case .alert:
            isPresented(keyPath: \Self.isAlertPresented)
        case .confirmationDialog:
            isPresented(keyPath: \Self.isConfirmationDialogPresented)
        }
    }
        
    func goTo(routeID: ModalsScreenModalRouteID) -> some View {
        Group {
            switch routeID {
            case .sheet:
                goToSheet()
            case .fullScreenCover:
                goToFullScreenCover()
            case .alert:
                goToAlert()
            case .confirmationDialog:
                goToConfirmationDialog()
            }
        }
    }
    
    func goToSheet() -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenVM(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(forModal: .sheet)
        )
    }
    
    func goToFullScreenCover() -> some View {
        TemplateScreenView(
            viewModel: TemplateScreenVM(
                coordinator: TemplateScreenCoordinator(parent: self)
            ),
            params: .init(forModal: .fullScreenCover)
        )
    }
    
    func goToAlert() -> some View {
        AlertActionsScreenView(
            viewModel: AlertActionsScreenVM(
                coordinator: AlertActionsScreenCoordinator(parent: self)
            )
        )
    }
    
    func goToConfirmationDialog() -> some View {
        ConfirmationDialogActionsScreenView(
            viewModel: ConfirmationDialogActionsScreenVM(
                coordinator: ConfirmationDialogActionsScreenCoordinator(parent: self)
            )
        )
    }
    
    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}

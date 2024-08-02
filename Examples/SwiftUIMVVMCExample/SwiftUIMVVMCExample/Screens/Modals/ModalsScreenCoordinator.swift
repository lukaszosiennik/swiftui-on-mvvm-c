//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI
import SwiftUI_MVVMC

protocol ModalsScreenCoordinating: Coordinating {
    
    associatedtype View: SwiftUI.View
    
    var isSheetPresented: Bool { get set }
    var isFullScreenCoverPresented: Bool { get set }
    var isAlertPresented: Bool { get set }
    var isConfirmationDialogPresented: Bool { get set }
    
    func goTo(routeID: ModalsScreenModalRouteID) -> View
}

final class ModalsScreenCoordinator: Coordinator, ModalsScreenCoordinating {
    
    @Published var isSheetPresented: Bool = false
    @Published var isFullScreenCoverPresented: Bool = false
    @Published var isAlertPresented: Bool = false
    @Published var isConfirmationDialogPresented: Bool = false
        
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
}

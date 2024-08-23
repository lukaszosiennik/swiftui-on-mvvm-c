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

    private weak var sheetTemplateScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?
    private weak var fullScreenCoverTemplateScreenVM: TemplateScreenVM<TemplateScreenCoordinator>?
    private weak var alertActionsScreenVM: AlertActionsScreenVM<AlertActionsScreenCoordinator>?
    private weak var confirmationDialogActionsScreenVM: ConfirmationDialogActionsScreenVM<ConfirmationDialogActionsScreenCoordinator>?

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

    func goToModal(routeID: ModalsScreenModalRouteID) -> some View {
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
            viewModel: viewModelProvider.perform(&sheetTemplateScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forModal: .sheet)
        )
    }

    func goToFullScreenCover() -> some View {
        TemplateScreenView(
            viewModel: viewModelProvider.perform(&fullScreenCoverTemplateScreenVM) {
                .init(coordinator: .init(parent: self))
            },
            params: .init(forModal: .fullScreenCover)
        )
    }

    func goToAlert() -> some View {
        AlertActionsScreenView(
            viewModel: viewModelProvider.perform(&alertActionsScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }

    func goToConfirmationDialog() -> some View {
        ConfirmationDialogActionsScreenView(
            viewModel: viewModelProvider.perform(&confirmationDialogActionsScreenVM) {
                .init(coordinator: .init(parent: self))
            }
        )
    }

    func goToRootRouteIDsScreen() -> Bool {
        goToRoot(routeID: AppRootRouteID.rootRouteIDs)
    }
}

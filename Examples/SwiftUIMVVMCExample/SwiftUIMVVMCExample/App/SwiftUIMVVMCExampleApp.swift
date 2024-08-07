//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

@main
struct SwiftUIMVVMCExampleApp: App {

    typealias ViewModel = AppVM<AppCoordinator>

    @ObservedObject
    var viewModel: ViewModel

    init() {
        self.init(
            viewModel: .init(coordinator: .init())
        )
    }

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some Scene {
        WindowGroup {
            viewModel.coordinator.goToCurrentRoute()
        }
    }
}

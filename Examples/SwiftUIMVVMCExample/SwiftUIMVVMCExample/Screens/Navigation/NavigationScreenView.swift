//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct NavigationScreenView<ViewModel: NavigationScreenViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            viewModel.coordinator.goToRoot()
        }
    }
}

#Preview {
    NavigationScreenView(
        viewModel: NavigationScreenViewModel(
            coordinator: NavigationScreenCoordinator(parent: nil)
        )
    )
}

//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

struct EmptyScreenView<ViewModel: EmptyScreenViewModelProtocol>: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    var body: some View {
        Text("Home Screen")
    }
}

#Preview {
    EmptyScreenView(
        viewModel: EmptyScreenViewModel(
            coordinator: EmptyScreenCoordinator(parent: nil)
        )
    )
}

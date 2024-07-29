//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

struct HomeScreenView<ViewModel: HomeScreenViewModelProtocol>: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    var body: some View {
        Text("Home Screen")
    }
}

#Preview {
    HomeScreenView(
        viewModel: HomeScreenViewModel(
            coordinator: HomeScreenCoordinator(parent: nil)
        )
    )
}

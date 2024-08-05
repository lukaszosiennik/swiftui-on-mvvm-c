//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI

struct EmptyScreenView<ViewModel: EmptyScreenViewModel>: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    var body: some View {
        Text("Empty Screen")
    }
}

#Preview {
    EmptyScreenView(
        viewModel: EmptyScreenVM(
            coordinator: EmptyScreenCoordinator(parent: nil)
        )
    )
}

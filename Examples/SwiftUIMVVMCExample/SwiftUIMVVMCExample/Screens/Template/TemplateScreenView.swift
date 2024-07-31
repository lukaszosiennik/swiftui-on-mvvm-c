//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI
import SwiftUI_MVVMC

struct TemplateScreenView<ViewModel: TemplateScreenViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let params: Params
    
    var body: some View {
        VStack {
            Text("\(params.title) Screen")
        }
    }
}

#Preview {
    TemplateScreenView(
        viewModel: TemplateScreenViewModel(
            coordinator: TemplateScreenCoordinator(parent: nil)
        ),
        params: .init(title: "")
    )
}

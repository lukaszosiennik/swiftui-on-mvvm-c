//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI

struct TabBarScreenView<ViewModel: TabBarScreenViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    private let tabViewParams: [TabBar.Tab.ViewParamsIdentified]
    
    init(viewModel: ViewModel) {
        self.init(
            viewModel: viewModel,
            tabViewParams: TabBar.Tab.allCases.map(TabBar.Tab.ViewParamsIdentified.init)
        )
    }
    
    init(
        viewModel: ViewModel,
        tabViewParams: [TabBar.Tab.ViewParamsIdentified]
    ) {
        self.viewModel = viewModel
        self.tabViewParams = tabViewParams
    }

    var body: some View {
        HStack {
            Spacer()
            Button("GoTo RootRouteIDs Screen") {
                viewModel.coordinator.goToRootRouteIDsScreen()
            }
            Spacer().frame(width: 20)
        }
        TabView {
            ForEach(tabViewParams) { viewParams in
                viewModel.coordinator.goTo(routeID: viewParams.routeID)
                .tabItem {
                    Label(
                        viewParams.title,
                        systemImage: viewParams.imageName
                    )
                }
                .tag(viewParams.routeID)
            }
        }
    }
}

#Preview {
    TabBarScreenView(
        viewModel: TabBarScreenVM(
            coordinator: TabBarScreenCoordinator(parent: nil)
        )
    )
}

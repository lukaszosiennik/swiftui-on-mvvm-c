//
//  Created by Łukasz Osiennik on 22/06/2024.
//

import SwiftUI

struct RootRouteIDsScreenView<ViewModel: RootRouteIDsScreenViewModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let params: Params
    
    var body: some View {
        VStack {
            Text("RootRouteIDs Screen")
            
            Spacer().frame(height: 20)
            
            ForEach(AppRootRouteID.allCases) { routeID in
                if routeID != params.excludedRouteID {
                    Button("GoTo \(screenName(for: routeID)) RootScreen") {
                        viewModel.coordinator.goToRoot(routeID: routeID)
                    }
                }
            }
        }
    }
    
    private func screenName(for routeID: AppRootRouteID) -> String {
        switch routeID {
        case .launch:
            "Launch"
        case .rootRouteIDs:
            "RootRouteIDs"
        case .home:
            "Home"
        }
    }
}

#Preview {
    RootRouteIDsScreenView(
        viewModel: RootRouteIDsScreenVM(
            coordinator: RootRouteIDsScreenCoordinator(parent: nil)
        ),
        params: .init(
            excludedRouteID: .launch
        )
    )
}

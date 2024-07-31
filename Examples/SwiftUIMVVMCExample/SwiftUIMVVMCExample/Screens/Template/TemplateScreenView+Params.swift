//
//  Created by Łukasz Osiennik on 31/07/2024.
//

extension TemplateScreenView {
 
    struct Params: Equatable {
        
        let title: String
    }
}

extension TemplateScreenView.Params {
    
    init(for routeID: NavigationRootScreenNavigationRouteID) {
        self = {
            switch routeID {
            case .first:
                .init(title: "NavigationStack First")
            case .second:
                .init(title: "NavigationStack Second")
            case .third:
                .init(title: "NavigationStack RootRouteIDs")
            }
        }()
    }
}

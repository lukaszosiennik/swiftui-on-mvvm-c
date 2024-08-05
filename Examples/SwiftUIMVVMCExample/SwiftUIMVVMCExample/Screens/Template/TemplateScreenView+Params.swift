//
//  Created by Łukasz Osiennik on 31/07/2024.
//

extension TemplateScreenView {
 
    struct Params {
        
        let title: String
    }
}

extension TemplateScreenView.Params {
    
    init(forTabBar routeID: TabBar.RouteID) {
        self = {
            switch routeID {
            case .first:
                .init(title: "TabView First")
            case .second:
                .init(title: "TabView Second")
            case .third:
                .init(title: "TabView Third")
            }
        }()
    }
}

extension TemplateScreenView.Params {
    
    init(forNavigation routeID: NavigationScreenNavigationRouteID) {
        self = {
            switch routeID {
            case .path:
                .init(title: "NavigationStack Path")
            case .link:
                .init(title: "NavigationStack Link")
            }
        }()
    }
}

extension TemplateScreenView.Params {
    
    init(forModal routeID: ModalsScreenModalRouteID) {
        self = {
            switch routeID {
            case .sheet:
                .init(title: "Sheet")
            case .fullScreenCover:
                .init(title: "FullScreenCover")
            case .alert:
                .init(title: "Alert")
            case .confirmationDialog:
                .init(title: "ConfirmationDialog")
            }
        }()
    }
}

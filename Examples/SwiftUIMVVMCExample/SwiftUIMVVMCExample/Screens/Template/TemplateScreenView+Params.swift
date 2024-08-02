//
//  Created by Łukasz Osiennik on 31/07/2024.
//

extension TemplateScreenView {
 
    struct Params: Equatable {
        
        let title: String
    }
}

extension TemplateScreenView.Params {
    
    init(forNavigation routeID: NavigationScreenNavigationRouteID) {
        self = {
            switch routeID {
            case .first:
                .init(title: "NavigationStack First")
            case .second:
                .init(title: "NavigationStack Second")
            case .third:
                .init(title: "NavigationStack Third")
            case .fourth:
                .init(title: "NavigationStack Fourth")
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

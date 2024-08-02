//
//  Created by Łukasz Osiennik on 06/06/2024.
//

extension TabBar.Tab {
    
    struct ViewParamsIdentified: Identifiable {
        
        var id: TabBar.Tab {
            tab
        }
        
        let tab: TabBar.Tab
        let viewParams: ViewParams
        
        var routeID: TabBar.RouteID {
            tab
        }
    }
    
    struct ViewParams {
        
        let title: String
        let imageName: String
    }
}

extension TabBar.Tab.ViewParamsIdentified {
    
    var title: String {
        viewParams.title
    }
    
    var imageName: String {
        viewParams.imageName
    }
}

extension TabBar.Tab.ViewParamsIdentified {
    
    init(for tab: TabBar.Tab) {
        self = {
            switch tab {
            case .first:
                .init(
                    tab: tab,
                    viewParams: .init(
                        title: "First",
                        imageName: "1.square"
                    )
                )
            case .second:
                .init(
                    tab: tab,
                    viewParams: .init(
                        title: "Second",
                        imageName: "2.square"
                    )
                )
            case .third:
                .init(
                    tab: tab,
                    viewParams: .init(
                        title: "Third",
                        imageName: "3.square"
                    )
                )
            }
        }()
    }
}

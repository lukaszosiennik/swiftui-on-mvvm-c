//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI_MVVMC

enum TabBar {
    
    typealias RouteID = Tab
    
    enum Tab: Int, CaseIterable, TabBarRouteID {
        
        case first
        case second
        case third
    }
}

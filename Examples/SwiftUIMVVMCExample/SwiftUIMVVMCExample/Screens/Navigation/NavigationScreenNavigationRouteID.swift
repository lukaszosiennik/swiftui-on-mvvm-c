//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

enum NavigationScreenNavigationRouteID: CaseIterable, NavigationRouteID {
         
    case first
    case second
    case third
}

struct NavigationScreenAllowedNavigationRouteIDs {
    
    var values: Set<NavigationScreenNavigationRouteID>
}

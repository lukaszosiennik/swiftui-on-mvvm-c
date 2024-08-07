//
//  Created by Łukasz Osiennik on 19/07/2024.
//

import SwiftUI_MVVMC

enum AppRootRouteID: Int, Identifiable, CaseIterable, RootRouteID {

    var id: Int {
        rawValue
    }

    case launch
    case rootRouteIDs
    case tabBar
    case navigationStack
    case modals
}

//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine

public protocol RootRouteIDManagerProtocol: AnyObject, ObservableObject {
    
    associatedtype RouteID: RootRouteID
    
    var currentRouteID: RouteID { get set }
}

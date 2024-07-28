//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine

protocol RootRouteManagerProtocol: AnyObject, ObservableObject {
    
    associatedtype RouteID: RootRouteID
    
    var currentRouteID: RouteID { get set }
}

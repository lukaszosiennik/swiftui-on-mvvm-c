//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI

public protocol ModalCoordinating: Coordinating {
    
    associatedtype View: SwiftUI.View
    
    associatedtype RouteID: ModalRouteID
    
    func isPresented(routeID: RouteID) -> Binding<Bool>
    
    func goToModal(routeID: RouteID) -> View
}

extension ModalCoordinating {
    
    public func isPresented(keyPath: ReferenceWritableKeyPath<Self, Bool>) -> Binding<Bool> {
        .init(get: { [weak self] in
            self?[keyPath: keyPath] as? Bool ?? false
        }, set: { [weak self] value in
            self?[keyPath: keyPath] = value
        })
    }
}

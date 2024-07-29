//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

open class ViewModel<
    Coordinator: CoordinatorProtocol
>: ViewModelProtocol, ObservedObjectChangeTransmitterProtocol {

    @ObservedObject 
    public var coordinator: Coordinator
    
    var transmissionSubscription: AnyCancellable?

    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        initiateTransmission(for: coordinator)
    }
}

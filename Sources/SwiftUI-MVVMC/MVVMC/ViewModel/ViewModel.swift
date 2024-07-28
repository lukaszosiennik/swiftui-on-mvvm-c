//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine
import SwiftUI

class ViewModel<
    Coordinator: CoordinatorProtocol
>: ViewModelProtocol, ObservedObjectChangeTransmitterProtocol {

    @ObservedObject 
    var coordinator: Coordinator
    
    var transmissionSubscription: AnyCancellable?

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        initiateTransmission(for: coordinator)
    }
}

//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Combine

protocol ObservedObjectChangeTransmitterProtocol: AnyObject, ObservableObject
where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
    
    var transmissionSubscription: AnyCancellable? { get set }
}

extension ObservedObjectChangeTransmitterProtocol {
    
    func initiateTransmission<Object: ObservableObject>(for object: Object) {
        transmissionSubscription = object
            .objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
    }
}

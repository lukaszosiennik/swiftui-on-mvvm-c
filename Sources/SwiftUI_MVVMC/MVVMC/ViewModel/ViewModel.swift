//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Foundation

public protocol ViewModel: AnyObject, ObservableObject {

    associatedtype Coordinator: Coordinating

    var coordinator: Coordinator { get set }
}

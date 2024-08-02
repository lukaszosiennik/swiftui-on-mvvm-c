//
//  Created by Łukasz Osiennik on 28/07/2024.
//

import Foundation

public protocol Coordinating: AnyObject, ObservableObject {
    
    associatedtype Coordinator: Coordinating
    
    var parent: Coordinator? { get }
}

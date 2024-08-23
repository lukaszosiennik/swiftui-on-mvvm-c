//
//  Created by Łukasz Osiennik on 28/07/2024.
//

open class Coordinator: Coordinating {

    public private(set) weak var parent: Coordinator?

    public private(set) var children: [Weak<Coordinator>] = .init()

    public let viewModelProvider: ViewModelProvidable

    public init(
        parent: Coordinator?,
        viewModelProvider: ViewModelProvidable = ViewModelProvider()
    ) {
        self.parent = parent
        self.viewModelProvider = viewModelProvider

        initiateChildren()

        print("init: \(Self.self)")
    }

    deinit {
        print("deinit: \(Self.self)")
    }

    private func initiateChildren() {
        parent?.children.append(.init(object: self))
        parent?.children.cleanUp()
    }
}

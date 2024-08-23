//
//  Created by Łukasz Osiennik on 23/08/2024.
//

public protocol ViewModelProvidable {

    func perform<VM: ViewModel>(
        _ viewModel: inout VM?,
        initiate: () -> VM
    ) -> VM
}

public final class ViewModelProvider: ViewModelProvidable {

    public init() {}

    public func perform<VM: ViewModel>(
        _ viewModel: inout VM?,
        initiate: () -> VM
    ) -> VM {
        let result = viewModel ?? initiate()
        if viewModel == nil {
            viewModel = result
        }

        return result
    }
}

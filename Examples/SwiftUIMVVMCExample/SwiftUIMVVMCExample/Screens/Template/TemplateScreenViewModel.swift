//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol TemplateScreenViewModelProtocol: ViewModelProtocol
where Coordinator: TemplateScreenCoordinatorProtocol {}

final class TemplateScreenViewModel<
    Coordinator: TemplateScreenCoordinatorProtocol
>: ViewModel<Coordinator>, TemplateScreenViewModelProtocol {}

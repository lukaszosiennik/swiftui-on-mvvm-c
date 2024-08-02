//
//  Created by Łukasz Osiennik on 31/07/2024.
//

import SwiftUI_MVVMC

protocol TemplateScreenViewModel: ViewModel
where Coordinator: TemplateScreenCoordinating {}

final class TemplateScreenVM<
    Coordinator: TemplateScreenCoordinating
>: TransmittingVM<Coordinator>, TemplateScreenViewModel {}

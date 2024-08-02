//
//  Created by Łukasz Osiennik on 02/08/2024.
//

import SwiftUI_MVVMC

protocol ModalsScreenViewModel: ViewModel
where Coordinator: ModalsScreenCoordinating {}

final class ModalsScreenVM<
    Coordinator: ModalsScreenCoordinating
>: TransmittingVM<Coordinator>, ModalsScreenViewModel {}

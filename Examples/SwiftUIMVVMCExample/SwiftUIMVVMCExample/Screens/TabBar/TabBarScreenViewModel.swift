//
//  Created by Łukasz Osiennik on 31/05/2024.
//

import SwiftUI_MVVMC

protocol TabBarScreenViewModel: ViewModel
where Coordinator: TabBarScreenCoordinating {}

final class TabBarScreenVM<
    Coordinator: TabBarScreenCoordinating
>: TransmittingVM<Coordinator>, TabBarScreenViewModel {}

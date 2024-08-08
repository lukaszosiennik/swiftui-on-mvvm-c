# SwiftUI on MVVM-C

[Short description of the library]: #

* [About architecture](#about-architecture)
* [Example app](#example-app)
* [How to use in your app](#how-to-use-in-your-app)
* [Community](#community)

## About architecture

![image info](./docs/UML/architecture.png)

[Description of the architecture and components]: #

### View Model
* `ViewModel`
* `TransmittingVM`

### Coordinator
* main
  * `Coordinating`
  * `Coordinator`
* root
  * `RootCoordinating`
  * `TransmittingRootCoordinator`
  * `RootRouteID`
* featured
  * navigation
    * `NavigationStackCoordinating`
    * `NavigationPathCoordinating`
    * `NavigationRouteID`
  * modal
    * `ModalCoordinating`
    * `ModalRouteID`
  * tab bar
    * `TabBarCoordinating`
    * `TabBarRouteID`


## Example app

[Description of the SwiftUIMVVMCExample app]: #

## How to use in your app

[Description of the library usage in your own app]: #

## Community

If you want to discuss anything related to the library, I invite you [here](https://github.com/lukaszosiennik/swiftui-on-mvvmc/discussions).

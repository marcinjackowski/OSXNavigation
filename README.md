# OSXNavigation

Simple example how to write navigation in OSX application written in Swift. 

## Usage

1. In ViewController there's two methods to push and pop viewControllers.
2. In WindowViewController there's a method to control navigation.
3. CustomPresentationAnimator is a class to presentation and dismiss viewController.

Push view controller

```swift
// Init view controller
let testViewController = TestViewController()
// Choose method from ViewController to push controller
pushViewController(testViewController)
```

Pop view controller


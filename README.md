# Swift-SwiftUI-Demo

**Pushing/Presenting SwiftUI Views from UIViewController**

In modern iOS development, SwiftUI is often the preferred approach for building user interfaces. However, there might be situations where you need to integrate SwiftUI views within a UIKit application managed by `UIViewController` classes. Here's how to achieve this for pushing and presenting SwiftUI views in your application:

**Pushing a SwiftUI View**

1. **Create the SwiftUI View:**
   - Design your SwiftUI view using the `struct` or `class` syntax. Ensure it provides the desired visual representation and interactions.

2. **Embed in a UIHostingController:**
   - Create a `UIHostingController` instance and set its `rootView` property to your SwiftUI view. This controller acts as a bridge between UIKit and SwiftUI.

   ```swift
   let hostingController = UIHostingController(rootView: MySwiftUIView())
   ```

3. **Push the Controller:**
   - Access the UIViewController's navigation controller (if it exists) using `self.navigationController`.
   - Call `pushViewController(_:animated:)` on the navigation controller, passing the `hostingController` instance as the view controller to push.

   ```swift
   if let navigationController = self.navigationController {
       navigationController.pushViewController(hostingController, animated: true)
   }
   ```

**Presenting a SwiftUI View**

1. **Create the SwiftUI View:**
   - Follow step 1 from the pushing section.

2. **Embed in a UIHostingController:**
   - Follow step 2 from the pushing section.

3. **Present the Controller Modally:**
   - Call `present(_:animated:completion:)` on the UIViewController instance, passing the `hostingController` instance as the view controller to present. You can optionally provide animations and completion handlers.

   ```swift
   self.present(hostingController, animated: true, completion: nil)
   ```

**Important Considerations:**

- Ensure your UIViewController class has a navigation controller if you intend to use pushing.
- For a more SwiftUI-centric approach, consider embedding UIKit views within a SwiftUI view hierarchy (less common in existing UIKit applications).
- Refer to Apple's documentation for detailed information on `UIHostingController` and navigation controllers:
    - `UIHostingController`: [https://developer.apple.com/documentation/swiftui/uihostingcontroller](https://developer.apple.com/documentation/swiftui/uihostingcontroller)
    - Navigation Controllers: [https://developer.apple.com/documentation/uikit/uinavigationcontroller](https://developer.apple.com/documentation/uikit/uinavigationcontroller)


By following these steps and considering the potential approaches, you can effectively push and present SwiftUI views from UIViewController classes in your application.
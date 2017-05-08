# BFRatingView

A beautiful simple rating view for iOS.

![image](https://github.com/wizardguy/screenshots/raw/master/BFRatingView.png)

### 1. How To Use

1) copu the ./BFRatingView/ folder into your project
2) Replace your own icon resource if needed
3) Init your BFRatingView:
```swift
let view = BFRatingView.ratingView(title: "Rating!", button: "Like Me!", image: "rate", in: self.view, delegate: self, identity: "DemoRatingView")
```
4) Define your own rating decision via BFRatingViewDelegate;
5) Call:
```swift
view?.check()
```
6) Build and Run!


### 2. BFRatingViewDelegate
```swift
@objc protocol BFRatingViewDelegate {
	 // the policy of whether to show the rating view or not when you call check()
    func ratingViewShouldDisplay(_ view:BFRatingView) -> Bool
    // call back when user clicks the rating button
    func ratingViewDidSelectButton(_ view:BFRatingView)
    // call back when the view is closed without rating
    @objc optional func ratingViewDidClosed(_ view:BFRatingView)
}
```

### 3. Note:
If you have to display multiple rating view for different user senariors, you can use the **viewID** property of BFRatingView to identify each rating in delegate:
```objc
func ratingViewShouldDisplay(_ view: BFRatingView) -> Bool {
        switch view.viewID {
        case "DemoRatingView":
            return true
        default:
            return false
        }
    }
```
![image](https://github.com/wizardguy/screenshots/raw/master/BFRatingView.gif)


# BFRatingButton

Along with the BFRatingView, here also comes a customized button - BFRatingButton.

By default, it is a round corner, background color change-able button.

In iOS, the UIButton can not be set different color when clicking very easily. You need to use background image property to accomplish this. BFRatingButton does this for you and explore out a property - **selectedBackgroundColor** which can let you configure the color very easily.

Check out the demo project for more details.


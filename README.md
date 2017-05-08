# BFRatingView

A beautiful simple rating view for iOS.

![image](https://github.com/wizardguy/screenshots/raw/master/BFRatingView.png)

### How To Use

1) copu the ./BFRatingView/ folder into your project
2) Replace your own icon resource if needed
3) Init your BFRatingView:
```objc
let view = BFRatingView.ratingView(title: "Rating!", button: "Like Me!", image: "rate", in: self.view, delegate: self, identity: "DemoRatingView")
```
4) Define your own rating decision via BFRatingViewDelegate;
5) Call:
```objc
view?.check()
```
6) Build and Run!


### BFRatingViewDelegate
```objc
@objc protocol BFRatingViewDelegate {
    func ratingViewShouldDisplay(_ view:BFRatingView) -> Bool
    func ratingViewDidSelectButton(_ view:BFRatingView)
    @objc optional func ratingViewDidClosed(_ view:BFRatingView)
}
```

![image](https://github.com/wizardguy/screenshots/raw/master/BFRatingView.gif)
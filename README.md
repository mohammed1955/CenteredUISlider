# CenterdUISlider
![](https://img.shields.io/badge/Swift-5.2-blue.svg?style=flat)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/mohammed1955/CenteredUISlider/blob/master/LICENSE)

</br>

## Features

1) `You can use it with storyboard and Programmatically`
2) `Easy to customize and interact `


## Requirements

- iOS 11.0+
- Xcode 9+

## Swift Package Manager

CenterdUISlider is available through Swift Package Manager. To install
it, simply go to Xcode under `File > Swift Packages > Add Package Dependency...`

## Manually

If you prefer not to use SPM, you can integrate CenterdUISlider into your project manually.

## Usage

### Storyboard
You can use CenterdUISlider from storyboard easily By changing the type of a regular UIView into CenterdUISlider and set its Moudle to be CenterdUISlider.

###  Programmatically
```swift

    let centerdSlider = CenteredUISlider()
    centerdSlider.translatesAutoresizingMaskIntoConstraints = false
    centerdSlider.rangeValue = 50
    centerdSlider.progressColor = .purple
    
    centerdSlider.getSLiderValue = { value in
        print(value)
    }

```
## Author

Mohammed Reza Ghate

- https://github.com/mohammed1955
- https://www.linkedin.com/in/mohamadrezaghate/
- mohammed.r.ghate@gmail.com

## License

CenteredUISlider is available under the MIT license. See the LICENSE file for more info.

# Android Supporting Multiple Screens

## Overview

* The target platform for Android Uis are many and varied in sizes and densities.
* As of Android 1.6 multiple screen sizes and densities were supported
* The idea is to optimise your UI for any device&#39;s screen without having to design for ALL possibilities
* To simplify Android gives us ways to map to various screen densities and sizes

## Screen densities
To simplify design Android divided the range of screen densities into a set of generalized densities

| General size|Name|dpi(ppi) | factor |
| --- | --- | --- | --- |
| ldpi | Low | 120 | .75 |
| mdpi | Medium (baseline) | 160 | 1 |
| hdpi | High | 240 | 1.5 |
| xhdpi | Extra high | 320 | 2 |
| xxhdpi | Extra extra high | 480 | 3 |
| xxxhdpi | Extra extra extra high | 640 | 4 |

## General densities

* Each generalized density spans a range of real device densities

| **General size**|**Name**|**dpi(ppi)** | **factor** |
| --- | --- | --- | --- |
| ldpi | Low | 120 | .75 |
| mdpi | Medium (baseline) | 160 | 1 |
| hdp | High | 240 | 1.5 |
| xhdpi | Extra high | 320 | 2 |
| xxhdpi | Extra extra high | 480 | 3 |
| xxxhdpi | Extra extra extra high | 640 | 4 |

311dpi screen
442dpi screen

# Alternate drawables
<img src="https://cdn.discordapp.com/attachments/307959450805862400/372075493853233153/unknown.png">

* Have alternates for different screen densities for at least the launcher icon.
* You want the icon to look good on any density.
* If you include other bitmap drawables (.png, .gif, or .jpg and .9.png) you should provide alternates for different densities
* When you create alternates follow a scaling ratio of: 3:4:6:8:12:16

## Alternate drawable launcher icons
!!!note 
    Not only launcher icons (res/mipmap)but any drawable (res/drawable) is to be put in theresource directory appropriate to its density.

Should you have only one image meant for all densities use the default res/drawable directory

| Icon size in pixels | Density | Scale | Resource directory |
| --- | --- | --- | --- |
| 36x36 | Low | .75 | res/mipmap-ldpi |
| 48x48 | Medium | 1 (baseline) | res/mipmap-mdpi |
| 72x72 | High | 1.5 | res/mipmap-hdpi |
| 96x96 | Extra high | 2 | res/mipmap-xhdpi |
| 144x144 | Extra extra high | 3 | res/mipmap-xxhdpi |
| 192x192 | Extra extra extrahigh        [

### Exercise
* Using any app let’s give it a custom icon
* Run the [generator](romannurik.github.io/AndroidAssetStudio/icons-launcher.html) to create your own icon
* Download the icons and copy them into your app mipmap folder(s)
* Install your app, the icon will be your custom icon

## Screen sizes
Since Android 3.2 size qualifiers are used.  These sizes correspond not to actual screen sizes but to the width and height in dp (density independent pixels) that are available to your activity’s window.

| Screen configuration | Qualifier values | Examples | Description |
| --- | --- | --- | --- |
| smallestWidth | sw&lt;N&gt;dp | sw600dp sw720dp | Smallest possible width.Regardless of orientation N dps ofwidth are availablefor this UI .MOST USED OPTION |
| Available screen width | w&lt;N&gt;dp | w720dp w1024dp | Minimum available width required. |
| Available screen height | h&lt;N&gt;dp | H720dp H1024dp | Minimum available height required. RARELY USED as mostdevices will scroll vertically only width isrestricted. |

## Typical screen widths

 * 320dp: a typical phone screen (240x320 ldpi, 320x480 mdpi, 480x800 hdpi, etc
 * 480dp: a tweener tablet like the Streak (480x800 mdpi
 * 600dp: a 7&quot; tablet (600x1024 mdpi).
 * 720dp: a 10&quot; tablet (720x1280 mdpi, 800x1280 mdpi, etc).

## Example configurations
 Should I need different layouts for small and large displays I would use the following:
 * res/layout/main\_activity.xml For handsets (smaller than 600dp available width
 * res/layout-sw600dp/main\_activity.xml # For 7&quot; tablets (600dp wide and bigger)
 * res/layout-sw720dp/main\_activity.xml # For 10&quot; tablets (720dp wide and bigger)

### For more examples and information see
 https://developer.android.com/guide/practices/screens_support.html#DeclaringTabletLayouts

[DeclaringTabletLayouts
](https://developer.android.com/guide/practices/screens_support.html#DeclaringTabletLayouts)

## Resource Mapping
* Build the application layout through XML configuration files
* Define two different XML layouts for two different devices
* At runtime, Android detects the current device configuration and loads the appropriate resources for the application
* No need to recompile!
* Just add a new XML file if you need to support a new device

<img src="https://cdn.discordapp.com/attachments/307959450805862400/372076518693797888/unknown.png">

## References
* http://www.vogella.com/tutorials/AndroidDrawables/article.html#xml-drawables
* https://developer.android.com/guide/practices/screens_support.html
* https://developer.android.com/guide/practices/screens_support.html#DeclaringTabletLayouts
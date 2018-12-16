# Unsplash PhotoGallery

<p>Photo Gallery is an photo browser. With the photo gallery you can preview and your pictures in a easier way.
Photo Gallery is the well-designed Gallery replacement for the built-in phone Gallery.
This is the Fast, light and modern Photo Gallery with special animated gallery looks for your phone.

The application has been using <b>Unsplash</b> API
<br><b>ApiKey:</b> 15d849a0592bd2acf99b00d6da7b29c1645f6c68a853e0c2acf6cbd07f60dbed</br>
</p>

# Application Architecture
<p>Model-View-ViewModel (MVVM) was used. Representable protocols a bit different than other MVVM implementations. They exist only to hide view models details and share common methods between them by protocol-oriented programming concepts.
There’s a special layer between the View and the Model called the ViewModel. ViewModel provides a set of interfaces, each of which represents a UI component in the View. 

We can use a few technique called for about the 'binding' to connect UI components to ViewModel interfaces. I used delegate for the observing. We can use a few options, Such as Signal, Delegate, KVO, Observer or Functional programing.

In MVVM, we do not use the View directly, we allocate ViewModel as logic and Therefore, We can write a unit test for the presentational logic without knowing the implementation of the View.</p>

<b>How to build</b>
<p>This search is available through CocoaPods. To install it, simply add the following line to your Podfile:</p>
<pre>
download or clone the repo.
$ sudo gem install cocoapods
$ pod install
</pre>

<h1></h1>

<b>Overview</b>
<pre>
Swift 4.2
Xcode 10.1
</pre>

<h1></h1>

<b>Libraries used</b>
<pre>
R.swift
Moya
Kingfisher
PromisesSwift
</pre>

<h1></h1>

<b>Test used</b>
<br>You can check "TrendPhotoModelSpec.swift"</br>
<pre>
Quick
Nimble
SwiftHamcrest
</pre>

<h1></h1>

<b>Hierarchy</b>

<pre>
<b>[PhotoGallery]</b>
  [Helper]
    [Utils]
    [Extensions]
    [Config]
  [Service]
    [Mock]
  <i>[Model]</i>
  <i>[View]</i>
    [TrendsList]
    [TrendDetail]
  <i>[ViewModel]</i>
    [Core]
</pre>

<h1></h1>

<img src="https://github.com/serdarbakirtas/PhotoGallery/blob/develop/Screenshots/iphone01.png" alt="HTML5 Icon" width="200" height="433"> <img src="https://github.com/serdarbakirtas/PhotoGallery/blob/develop/Screenshots/iphone03.png" alt="HTML5 Icon" width="200" height="433"> <img src="https://github.com/serdarbakirtas/PhotoGallery/blob/develop/Screenshots/iphone02.png" alt="HTML5 Icon" width="433" height="200">

# ios-code-exercise

What testing framework did you use and why?
- Used xctest framework because native support allows for fast iteration and integartion with CI as well 
Which testing frameworks were considered?
Appium and Detox were also considered due to end-to-end testing and automation framework for capability for mobile apps. Both Appium and Detoz, also supports cross-platform on both Android and iOS. The only issue is that Detox is not supported to run on real iOS devices yet.  

Assuming that you’ve already been provided a CI environment and infrastructure
to run the tests. Write a script that will build the app and execute the tests.

- A  .travis.yml script has been added for integration with travis CI. This build script builds the project for the iOS simulator and builds the unit tests as well.



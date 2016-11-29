fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Run tests
### ios bump_build_number
```
fastlane ios bump_build_number
```
Bump build number (CFBundleVersion)
### ios bump_major_version
```
fastlane ios bump_major_version
```
Bump major version
### ios bump_minor_version
```
fastlane ios bump_minor_version
```
Bump minor version
### ios bump_patch_version
```
fastlane ios bump_patch_version
```
Bump patch version
### ios default_changelog
```
fastlane ios default_changelog
```
Returns a default changelog

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).

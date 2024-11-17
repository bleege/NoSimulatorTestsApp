# NoSimulatorTestsApp

## Description

iOS project to demonstrate running unit tests without having to launch an iOS Simulator.  Instead the unit tests are run via the host's macOS enivornment.
This enables unit tests to complete quicker while eliminating the risk of failure on CI due to an iOS Simulator not launching.

## Project Structure

The project consists of 3 Frameworks:

1. NoSimulatorTestsApp
    * iOS App containing SwiftUI View and ViewModel
2. NoSimulatorModel
    * Data Layer with no dependencies on UI Frameworks
4. NoSimulatorModelTests
    * Unit Tests for NoSimulatorModel 

<img width="517" alt="project-structure" src="https://github.com/user-attachments/assets/a57a7179-7e73-4e0b-87f4-b9d3c982fb43">

## Architecture

The app uses SwiftUI for the View along with a common MVVM structure using View Models accessing data via the Repoistory Pattern and Data Managers.  The Model and Test layers use Swift, CoreData, and Swift Testing.

## Testing

Testing without an iOS Simulator is configured by setting `Host Application` to `None`.

<img width="960" alt="no-hosting-app" src="https://github.com/user-attachments/assets/5756dcf0-b0f5-4db3-ad13-ff48a22b8369">

## App Functionality

The app's functionality is to create and persist button tap data in Core Data and then display it on the main screen.

<img width="500" alt="app-ui" src="https://github.com/user-attachments/assets/177c0008-c6c8-4d05-817a-053b5a130bb5">



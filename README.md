# Dessert Delight

This iOS app allows users to browse and explore recipes using TheMealDB API. Users can view a list of desserts, sorted alphabetically, and select a specific meal to see its details, including the meal name, instructions, and ingredients/measurements.

## Screenshots
| Home Screen | Detail Screen |
|------------|-------------|
| ![Home-ligh](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/fc437f7d-326b-4842-94c9-ded4659845be) | ![Detail-light](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/39ea2592-1fd0-4b53-b983-99e352875234) |
| ![Home-Dark](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/c6944335-7df9-49a7-b21c-0992f678c405) | ![Detail-Dark](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/c3566ca6-8b80-411a-b134-4ca6a84f9019) |


## Requirements

- **Xcode Version:** 15.0.1
- **Minimum iOS Version:** iOS 15

## Getting Started

To experience the joy of Dessert Delight, follow these simple steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on an iOS 15 or later device.

## Architecture

Dessert Delight is built on the MVVM (Model-View-ViewModel) architecture.
MVVM makes the app testable and maintainable.

## Accessibility

Dessert Delight has been crafted with accessibility in mind, providing a user-friendly experience for everyone. The app supports **Dark Mode**, making it easy on the eyes in low-light conditions, and **dynamic font sizing** for personalized readability.

## Unit Testing

View Models are unit tested using Mock stubbing approach. 
Local json files are used to simulate api responses. This approach allows for testing various scenerios including successful and failure responses. 

## Dependencies
- Kingfisher - https://github.com/onevcat/Kingfisher

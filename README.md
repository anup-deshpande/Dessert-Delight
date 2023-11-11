# Dessert Delight

This iOS app allows users to browse and explore recipes using TheMealDB API. Users can view a list of desserts, sorted alphabetically, and select a specific meal to see its details, including the meal name, instructions, and ingredients/measurements.

## Screenshots
| Home Screen | Detail Screen |
|------------|-------------|
| ![Home-ligh](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/747edd04-3c23-4394-b0db-3cf3cf17f15c)| ![Detail-light](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/4b29415e-8b6b-43c8-a7af-5aaf680e9a09) 
| ![Home-Dark](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/adabc510-9e28-4af5-8543-5e03c61cfbd6) | ![Detail-Dark](https://github.com/anup-deshpande/Dessert-Delight/assets/42949670/6bcdd94f-2f6b-4b6f-8120-259fb518fbbc) |

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

# Challenge iOS

## Project

This is a project developed in Swift using ViewCode as the approach for building interfaces. The adopted architecture is MVVM (Model-View-ViewModel), which clearly separates presentation responsibilities from business logic. 

The project utilizes URLSession for network communication, enabling efficient management of HTTP requests. Additionally, it's protocol-oriented, using dependency injection to promote modular and testable code.

## Project Structure

The project is structured as follows:

- **Model**: Contains data structures used by the application.
- **View**: Responsible for displaying the user interface, implementing Views and ViewControllers.
- **ViewModel**: Contains the business logic of the application, separating presentation logic from data logic.
- **Service**: Responsible for communicating with external services, such as APIs, using URLSession.
- **Tests**: Directory for the application's unit tests.

## Dependencies

The project uses URLSession natively for network communication, with no external dependencies beyond Swift's standard libraries.

## Unit Testing

Unit tests are implemented for service classes and other core classes of the project. They are located in the "Tests" directory and are executed to ensure the integrity and correct functionality of different parts of the application.

## Under Development

This project is under continuous development, and improvements are being made regularly. If you wish to contribute, feel free to open issues or pull requests.

## How to Run

To run the project, follow these steps:

1. Clone the repository on your local machine.
2. Open the `.xcodeproj` file in Xcode.
3. Build and run the project on a simulator or device.

## Contribution

Contributions are welcome! Feel free to report issues, suggest improvements, or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

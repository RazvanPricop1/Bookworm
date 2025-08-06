# 📚 Bookworm

A SwiftUI application for tracking and managing your personal book collection. Built for iOS and macOS with modern Swift technologies.

[![CI](https://github.com/RazvanPricop1/Bookworm/actions/workflows/ci.yml/badge.svg)](https://github.com/RazvanPricop1/Bookworm/actions/workflows/ci.yml)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20|%20macOS-blue.svg)](https://developer.apple.com)

## Features

- 📖 **Book Management**: Add, edit, and delete books from your collection
- ⭐ **Rating System**: Rate books with both star ratings and emoji reactions
- 🎨 **Genre Categories**: Organize books by genre with beautiful icons
- 💾 **Data Persistence**: Uses SwiftData for reliable local storage
- 🌟 **SwiftUI Interface**: Modern, native user interface
- 📱 **Multi-Platform**: Runs on both iOS and macOS

## Screenshots

*Screenshots would go here*

## Requirements

- iOS 18.1+ / macOS 15.1+
- Xcode 16.1+
- Swift 5.0+

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/RazvanPricop1/Bookworm.git
cd Bookworm
```

### Open in Xcode
```bash
open Bookworm/Bookworm.xcodeproj
```

### Build and Run
1. Select your target device/simulator
2. Press `Cmd+R` to build and run

## Development

### Quick Commands
We provide convenient scripts for common development tasks:

```bash
# Using the development script
./dev.sh build-ios     # Build for iOS
./dev.sh test-macos    # Run macOS tests
./dev.sh lint          # Check code quality

# Using Make commands
make build-ios         # Build for iOS
make test-all          # Run all tests
make lint              # Run SwiftLint
make install           # Install dependencies
```

### Project Structure
```
Bookworm/
├── Bookworm/          # Main application code
│   ├── Models/        # Data models (Book.swift)
│   ├── Views/         # SwiftUI views
│   └── Assets/        # Images and resources
├── BookwormTests/     # Unit tests
├── .github/           # CI/CD workflows
└── dev.sh             # Development helper script
```

## Architecture

- **SwiftUI**: Declarative user interface
- **SwiftData**: Modern data persistence
- **MVVM Pattern**: Clean separation of concerns
- **Modular Design**: Reusable components

## Testing

### Running Tests
```bash
# All platforms
make test-all

# Specific platform
make test-ios
make test-macos

# Via Xcode
# Press Cmd+U in Xcode
```

### Test Coverage
- ✅ Model validation tests
- ✅ View component tests  
- ✅ Rating system tests
- ✅ Data persistence tests

## Code Quality

### SwiftLint
The project uses SwiftLint for code quality enforcement:

```bash
# Run linting
make lint

# Auto-fix issues
make lint-fix
```

Configuration in `.swiftlint.yml` with project-specific rules.

## CI/CD

### Automated Workflows
- **Continuous Integration**: Builds and tests on every push/PR
- **Release Automation**: Creates distribution builds on version tags
- **Code Quality**: Automated SwiftLint analysis
- **Security Scanning**: Basic vulnerability detection

### Build Status
- ✅ **iOS Build**: Automated testing on iOS Simulator
- ✅ **macOS Build**: Native macOS application testing
- ✅ **Code Quality**: SwiftLint compliance checking
- ✅ **Security**: Basic security vulnerability scanning

See [`AUTOMATION.md`](AUTOMATION.md) for detailed CI/CD documentation.

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes and add tests
4. Ensure code quality: `make lint`
5. Run tests: `make test-all`
6. Commit changes: `git commit -m 'Add amazing feature'`
7. Push to branch: `git push origin feature/amazing-feature`
8. Open a Pull Request

### Development Guidelines
- Follow SwiftLint rules
- Write tests for new features
- Update documentation as needed
- Ensure compatibility with both iOS and macOS

## Versioning

We use [Semantic Versioning](http://semver.org/) for releases. See the [releases page](https://github.com/RazvanPricop1/Bookworm/releases) for available versions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with SwiftUI and SwiftData
- Icons and images from Apple's SF Symbols
- Automated testing and deployment via GitHub Actions

## Support

- 🐛 **Bug Reports**: [Open an issue](https://github.com/RazvanPricop1/Bookworm/issues)
- 💬 **Questions**: [Start a discussion](https://github.com/RazvanPricop1/Bookworm/discussions)
- 📧 **Contact**: [Email the maintainer](mailto:razvan@example.com)

---

Made with ❤️ by [Razvan Pricop](https://github.com/RazvanPricop1)
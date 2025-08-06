# Bookworm CI/CD Automation

This document describes the continuous integration and continuous deployment (CI/CD) automation setup for the Bookworm iOS/macOS application.

## Overview

Bookworm is a SwiftUI application for tracking books, supporting both iOS and macOS platforms. The automation includes building, testing, linting, and release workflows.

## Automation Features

### 🔄 Continuous Integration (CI)
- **Platforms**: iOS and macOS builds
- **Triggers**: Push to `main`/`develop` branches, Pull Requests
- **Testing**: Automated unit tests
- **Linting**: SwiftLint code quality checks
- **Security**: Basic security scanning

### 🚀 Release Automation  
- **Triggers**: Git tags (`v*`) or manual dispatch
- **Archives**: Creates iOS and macOS archives
- **Artifacts**: Uploads build artifacts for distribution

## Workflow Files

### `.github/workflows/ci.yml`
Main CI workflow that runs on every push and pull request:
- Builds for iOS and macOS
- Runs unit tests  
- Performs SwiftLint analysis
- Basic security scanning

### `.github/workflows/release.yml`
Release workflow for creating distribution builds:
- Creates Xcode archives
- Exports for App Store / Mac App Store
- Uploads build artifacts

## Code Quality

### SwiftLint Configuration
- Configuration file: `.swiftlint.yml`
- Enforces Swift coding standards
- Customized rules for the project

### Testing Structure
- Unit tests in `BookwormTests/` directory
- Tests for core models and views
- Easily extensible for new features

## Setup Instructions

### Prerequisites
- Xcode project with iOS/macOS targets
- GitHub repository
- macOS runners for GitHub Actions

### Adding Tests to Xcode Project
1. Open `Bookworm.xcodeproj` in Xcode
2. Create a new Test Target:
   - File → New → Target → iOS/macOS Unit Testing Bundle
   - Name: `BookwormTests`
3. Add the test files from `BookwormTests/` folder to the test target
4. Ensure the main app target is selected in "Target Membership"

### Customization

#### CI Workflow
- Modify platform matrix in `ci.yml` to add/remove platforms
- Adjust Xcode version in `setup-xcode` action
- Configure different test destinations

#### Release Workflow  
- Update provisioning profile settings
- Modify export options for distribution method
- Add code signing configuration

#### SwiftLint Rules
- Edit `.swiftlint.yml` to customize linting rules
- Add project-specific exclusions
- Configure rule severity levels

## Usage

### Running CI
CI runs automatically on:
- Push to `main` or `develop` branches
- Pull request creation/updates

### Creating Releases
1. **Tag-based release**:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. **Manual release**:
   - Go to Actions tab in GitHub
   - Select "Release" workflow
   - Click "Run workflow"
   - Enter version number

### Local Development
- Install SwiftLint: `brew install swiftlint`
- Run linting: `swiftlint` in project root
- Run tests in Xcode: `Cmd+U`

## Monitoring

### Build Status
- Check GitHub Actions tab for build status
- View detailed logs for debugging failures
- Monitor test results and coverage

### Artifacts
- Build artifacts are available for 30 days
- Download from successful release workflow runs
- Includes both iOS and macOS builds

## Troubleshooting

### Common Issues
1. **Build failures**: Check Xcode version compatibility
2. **Test failures**: Ensure test target is properly configured
3. **Lint failures**: Review SwiftLint output and fix violations
4. **Archive failures**: Verify provisioning profiles and certificates

### Support
- Check workflow logs in GitHub Actions
- Review Xcode build logs
- Ensure all dependencies are properly configured

## Contributing

When adding new features:
1. Write corresponding unit tests
2. Ensure SwiftLint compliance
3. Test on both iOS and macOS if applicable
4. Update documentation if needed

## Security Notes

- Never commit certificates or provisioning profiles
- Use GitHub Secrets for sensitive information
- Regular security scanning is included in CI pipeline
- Keep dependencies updated for security patches
#!/bin/bash

# Bookworm Local Development Script
# This script helps developers run common tasks locally

set -e

echo "🍎 Bookworm Development Helper"
echo "=============================="

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for required tools
echo "🔍 Checking development environment..."

if command_exists xcodebuild; then
    echo "✅ Xcode found: $(xcodebuild -version | head -n1)"
else
    echo "❌ Xcode not found - required for building iOS/macOS projects"
    exit 1
fi

if command_exists swiftlint; then
    echo "✅ SwiftLint found: $(swiftlint version)"
else
    echo "⚠️  SwiftLint not found - installing via Homebrew..."
    if command_exists brew; then
        brew install swiftlint
        echo "✅ SwiftLint installed"
    else
        echo "❌ Homebrew not found - please install SwiftLint manually"
        echo "   Visit: https://github.com/realm/SwiftLint#installation"
    fi
fi

# Navigate to project directory
cd "$(dirname "$0")/Bookworm"

echo ""
echo "📋 Available commands:"
echo "  build-ios     - Build for iOS Simulator"
echo "  build-macos   - Build for macOS"
echo "  test-ios      - Run iOS tests"
echo "  test-macos    - Run macOS tests"
echo "  lint          - Run SwiftLint"
echo "  clean         - Clean build artifacts"
echo "  help          - Show this help"

# Handle command line arguments
case "${1:-help}" in
    "build-ios")
        echo ""
        echo "🏗️  Building for iOS..."
        xcodebuild -project Bookworm.xcodeproj \
            -scheme Bookworm \
            -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
            -configuration Debug \
            build
        ;;
    "build-macos")
        echo ""
        echo "🏗️  Building for macOS..."
        xcodebuild -project Bookworm.xcodeproj \
            -scheme Bookworm \
            -destination 'platform=macOS' \
            -configuration Debug \
            build
        ;;
    "test-ios")
        echo ""
        echo "🧪 Running iOS tests..."
        xcodebuild -project Bookworm.xcodeproj \
            -scheme Bookworm \
            -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
            -configuration Debug \
            test
        ;;
    "test-macos")
        echo ""
        echo "🧪 Running macOS tests..."
        xcodebuild -project Bookworm.xcodeproj \
            -scheme Bookworm \
            -destination 'platform=macOS' \
            -configuration Debug \
            test
        ;;
    "lint")
        echo ""
        echo "🔍 Running SwiftLint..."
        if command_exists swiftlint; then
            swiftlint
            echo "✅ Linting complete"
        else
            echo "❌ SwiftLint not available"
            exit 1
        fi
        ;;
    "clean")
        echo ""
        echo "🧹 Cleaning build artifacts..."
        xcodebuild -project Bookworm.xcodeproj clean
        rm -rf ~/Library/Developer/Xcode/DerivedData/Bookworm-*
        echo "✅ Clean complete"
        ;;
    "help"|*)
        echo ""
        echo "📖 Usage: $0 [command]"
        echo ""
        echo "Examples:"
        echo "  $0 build-ios    # Build for iOS"
        echo "  $0 test-macos   # Run macOS tests"
        echo "  $0 lint         # Check code quality"
        ;;
esac

echo ""
echo "✨ Done!"
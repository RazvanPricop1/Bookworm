# Bookworm Makefile
# Provides convenient commands for local development

.PHONY: help install build-ios build-macos test-ios test-macos lint clean archive-ios archive-macos

# Default target
help:
	@echo "🍎 Bookworm Development Commands"
	@echo "================================"
	@echo ""
	@echo "Setup:"
	@echo "  install      Install development dependencies"
	@echo ""
	@echo "Building:"
	@echo "  build-ios    Build for iOS Simulator"
	@echo "  build-macos  Build for macOS"
	@echo ""
	@echo "Testing:"
	@echo "  test-ios     Run iOS tests"
	@echo "  test-macos   Run macOS tests"
	@echo "  test-all     Run tests for all platforms"
	@echo ""
	@echo "Quality:"
	@echo "  lint         Run SwiftLint analysis"
	@echo "  lint-fix     Auto-fix SwiftLint issues"
	@echo ""
	@echo "Release:"
	@echo "  archive-ios  Create iOS archive"
	@echo "  archive-macos Create macOS archive"
	@echo ""
	@echo "Maintenance:"
	@echo "  clean        Clean build artifacts"

# Install development dependencies
install:
	@echo "📦 Installing development dependencies..."
	@if ! command -v swiftlint >/dev/null 2>&1; then \
		echo "Installing SwiftLint..."; \
		brew install swiftlint; \
	else \
		echo "✅ SwiftLint already installed"; \
	fi

# Build targets
build-ios:
	@echo "🏗️  Building for iOS..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
		-configuration Debug \
		build

build-macos:
	@echo "🏗️  Building for macOS..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'platform=macOS' \
		-configuration Debug \
		build

# Test targets
test-ios:
	@echo "🧪 Running iOS tests..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
		-configuration Debug \
		test

test-macos:
	@echo "🧪 Running macOS tests..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'platform=macOS' \
		-configuration Debug \
		test

test-all: test-ios test-macos
	@echo "✅ All tests completed"

# Code quality
lint:
	@echo "🔍 Running SwiftLint..."
	@cd Bookworm && swiftlint

lint-fix:
	@echo "🔧 Auto-fixing SwiftLint issues..."
	@cd Bookworm && swiftlint --fix

# Archive targets for release
archive-ios:
	@echo "📦 Creating iOS archive..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'generic/platform=iOS' \
		-configuration Release \
		-archivePath ./build/Bookworm-iOS.xcarchive \
		archive

archive-macos:
	@echo "📦 Creating macOS archive..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj \
		-scheme Bookworm \
		-destination 'generic/platform=macOS' \
		-configuration Release \
		-archivePath ./build/Bookworm-macOS.xcarchive \
		archive

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@cd Bookworm && xcodebuild -project Bookworm.xcodeproj clean
	@rm -rf Bookworm/build/
	@rm -rf ~/Library/Developer/Xcode/DerivedData/Bookworm-*
	@echo "✅ Clean completed"
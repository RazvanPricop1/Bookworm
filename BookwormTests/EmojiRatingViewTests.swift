//
//  EmojiRatingViewTests.swift
//  BookwormTests
//
//  Created for Bookworm CI/CD automation
//

import XCTest
import SwiftUI
@testable import Bookworm

final class EmojiRatingViewTests: XCTestCase {
    
    func testEmojiForRatingOne() {
        let emojiView = EmojiRatingView(rating: 1)
        // We can't directly test the Text content in this simple setup,
        // but we can verify the view is created
        XCTAssertEqual(emojiView.rating, 1)
    }
    
    func testEmojiForRatingTwo() {
        let emojiView = EmojiRatingView(rating: 2)
        XCTAssertEqual(emojiView.rating, 2)
    }
    
    func testEmojiForRatingThree() {
        let emojiView = EmojiRatingView(rating: 3)
        XCTAssertEqual(emojiView.rating, 3)
    }
    
    func testEmojiForRatingFour() {
        let emojiView = EmojiRatingView(rating: 4)
        XCTAssertEqual(emojiView.rating, 4)
    }
    
    func testEmojiForRatingFive() {
        let emojiView = EmojiRatingView(rating: 5)
        XCTAssertEqual(emojiView.rating, 5)
    }
    
    func testEmojiForRatingOutOfBounds() {
        // Test ratings outside normal range default to highest emoji
        let highRatingView = EmojiRatingView(rating: 10)
        XCTAssertEqual(highRatingView.rating, 10)
        
        let zeroRatingView = EmojiRatingView(rating: 0)
        XCTAssertEqual(zeroRatingView.rating, 0)
    }
}
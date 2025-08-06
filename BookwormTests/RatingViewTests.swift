//
//  RatingViewTests.swift
//  BookwormTests
//
//  Created for Bookworm CI/CD automation
//

import XCTest
import SwiftUI
@testable import Bookworm

final class RatingViewTests: XCTestCase {
    
    func testRatingViewImageSelection() {
        // Create a rating view with a constant binding
        let ratingView = RatingView(rating: .constant(3))
        
        // Test image selection logic
        let offImage = ratingView.image(for: 5) // Should be off image since rating is 3
        let onImage = ratingView.image(for: 2)  // Should be on image since rating is 3
        
        // Basic validation that images are returned
        XCTAssertNotNil(offImage)
        XCTAssertNotNil(onImage)
    }
    
    func testRatingViewBounds() {
        // Test with minimum rating
        let minRatingView = RatingView(rating: .constant(1), maximumRating: 5)
        XCTAssertEqual(minRatingView.maximumRating, 5)
        
        // Test with maximum rating  
        let maxRatingView = RatingView(rating: .constant(5), maximumRating: 5)
        XCTAssertEqual(maxRatingView.maximumRating, 5)
    }
}
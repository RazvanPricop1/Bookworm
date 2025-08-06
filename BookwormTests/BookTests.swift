//
//  BookTests.swift
//  BookwormTests
//
//  Created for Bookworm CI/CD automation
//

import XCTest
@testable import Bookworm

final class BookTests: XCTestCase {
    
    func testBookInitialization() {
        // Test Book model initialization
        let book = Book(
            title: "Test Book",
            author: "Test Author", 
            genre: "Fiction",
            review: "A great test book",
            rating: 5
        )
        
        XCTAssertEqual(book.title, "Test Book")
        XCTAssertEqual(book.author, "Test Author")
        XCTAssertEqual(book.genre, "Fiction")
        XCTAssertEqual(book.review, "A great test book")
        XCTAssertEqual(book.rating, 5)
        XCTAssertNotNil(book.date)
    }
    
    func testBookRatingValidation() {
        // Test that rating is properly set
        let book = Book(
            title: "Rating Test",
            author: "Test Author",
            genre: "Test", 
            review: "Test",
            rating: 3
        )
        
        XCTAssertTrue(book.rating >= 1)
        XCTAssertTrue(book.rating <= 5)
    }
    
    func testBookDateCreation() {
        // Test that date is set to current time
        let beforeCreation = Date()
        let book = Book(
            title: "Date Test",
            author: "Test Author",
            genre: "Test",
            review: "Test", 
            rating: 4
        )
        let afterCreation = Date()
        
        XCTAssertTrue(book.date >= beforeCreation)
        XCTAssertTrue(book.date <= afterCreation)
    }
}
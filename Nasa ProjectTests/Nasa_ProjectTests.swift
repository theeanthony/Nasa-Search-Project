import XCTest
@testable import Nasa_Project

class Nasa_ProjectTests: XCTestCase {

    var viewModel: SearchViewModel!

    override func setUpWithError() throws {
        viewModel = SearchViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    //Test normal search
    func testSearch() throws {
        // Given
        let searchText = "moon"
        let expectation = XCTestExpectation(description: "Search Results Fetched")

        // When
        viewModel.searchText = searchText
        viewModel.search(newSearch: true)

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.searchResults.count > 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    //Test clear function that resets searchText, searchResults, currentpage and totalPageNumbers
    func testClearSearch() throws {
        // Given
        let expectation = XCTestExpectation(description: "Search Cleared")

        // When
        viewModel.searchText = "moon"
        viewModel.clearSearch()

        // Then
        DispatchQueue.main.async {
            XCTAssertTrue(self.viewModel.searchText.isEmpty)
            XCTAssertTrue(self.viewModel.searchResults.isEmpty)
            XCTAssertEqual(self.viewModel.currentPage, 1)
            XCTAssertEqual(self.viewModel.totalPageNumbers, 0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    //Test nextPage function that retrieves next page of items
    func testNextPage() throws {
        // Given
        let expectation = XCTestExpectation(description: "Next Page Loaded")

        // When
        viewModel.searchText = "moon"
        viewModel.search(newSearch: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.nextPage()
            expectation.fulfill()
        }

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.currentPage == 2)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    //Test prevPage function that retrieves page before items
    func testPrevPage() throws {
        // Given
        let expectation = XCTestExpectation(description: "Previous Page Loaded")

        // When
        viewModel.searchText = "moon"
        viewModel.search(newSearch: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.nextPage()
            self.viewModel.prevPage()
            expectation.fulfill()
        }

        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.currentPage == 1)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }
    
    //Test for a searchtext that pushes the boundaries of maximum characters
    func testCrazySearchText() throws {
        //Given
        let expectation = XCTestExpectation(description: "Search Results Empty Fetched")
        //When
        viewModel.searchText = "@@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:@UDHSJDSA*@@U&*(#&@789712398&(*&)&@)*(&#*)@&#&!@)*#&)(*&$$)@(&)*DJSADJS:DJAS:KJD:ASJD:LSKA"
        viewModel.search(newSearch: true)

        //Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertTrue(self.viewModel.searchResults.count == 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)

//        XCTAssertEqual(viewModel.fetchStatus, .Empty, "Empty Search should be returned for crazy search text")
    }
    //Text for a searchText that is empty string
    func testBlankSearch() throws {
        //Given
        let expectation = XCTestExpectation(description: "Empty searchText Fetched")
        //When
        viewModel.searchText = ""
        viewModel.search(newSearch: false)
        //Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            XCTAssertTrue(self.viewModel.fetchStatus == .AllGood)
            expectation.fulfill()

        }
        wait(for: [expectation], timeout: 5.0)

    }
    


}

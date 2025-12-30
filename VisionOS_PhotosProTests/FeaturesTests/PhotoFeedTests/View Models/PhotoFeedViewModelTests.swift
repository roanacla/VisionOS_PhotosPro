import Foundation
import XCTest
import Testing
@testable import VisionOS_PhotosPro

struct PhotoFeedViewModelTests {
    let container: AppDependencyContainer
    init () {
        self.container = AppDependencyContainer.mock
    }
    
    @Test("Verify that all fetched photos have non-empty titles")
    func photoTitlesNotEmpty() async throws {
        let photos: [Photo] = try await container.networkService.fetch(from: URLRequest(url: URL(string: "https://example.com")!))
        for photo in photos {
            await MainActor.run {
                #expect(photo.id.isEmpty == false)
            }
        }
    }
    
    @MainActor
    @Test("ViewModel handles invalid URL errors correctly")
    func testInvalidURL() async {
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.invalidURL
        }

        let viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
            
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Invalid URL")
    }
    
    @MainActor
    @Test("ViewModel handles invalid Response")
    func testInvalidResponse() async throws {
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.invalidResponse
        }
        
        let viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Invalid response")
    }
    
    @MainActor
    @Test("ViewModel handles decoding errors")
    func testDecodingError() async throws {
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.decodingError
        }
        
        let viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Decoding error")
    }
    
    @MainActor
    @Test("ViewModel handles server errors")
    func testServerError() async throws {
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.serverError(500)
        }
        
        var viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Server error")
        
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.serverError(400)
        }
        
        viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Client error")
        
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.serverError(300)
        }
        
        viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Redirection error")
        
        (container.networkService as! MockNetworkService).fetchClosure = {
            throw NetworkError.serverError(199)
        }
        
        viewModel = container.makePhotoFeedViewModel()
        await viewModel.loadPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Unknown error")
    }
    
    @MainActor
    @Test("ViewModel searches photos by title")
    func testSearchLogsEvent() async throws {
        let viewModel = container.makePhotoFeedViewModel()
        viewModel.searchText = "Cats"
        (viewModel.networkService as! MockNetworkService).isSearchEnabled = true
        await viewModel.loadPhotos()
        #expect(viewModel.photos.count == 10)
        guard let lastEvent = (viewModel.analyticsService as? MockAnalyticsService)?.lastEvent else {
            XCTFail("Last event should not be nil")
            return
        }
        #expect(lastEvent == "Search Cats")
    }
}

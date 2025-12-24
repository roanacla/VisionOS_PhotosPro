import Foundation
import XCTest
import Testing
@testable import VisionOS_PhotosPro

struct PhotoFeedViewModelTests {
    let fakeService = MockNetworkService()
    
    @Test("Verify that all fetched photos have non-empty titles")
    func photoTitlesNotEmpty() async throws {
        let photos: [Photo] = try await fakeService.fetch(from: URLRequest(url: URL(string: "https://example.com")!))
        for photo in photos {
            await MainActor.run {
                XCTAssertEqual(photo.title.isEmpty, false)
            }
        }
    }
    
    @MainActor
    @Test("ViewModel handles invalid URL errors correctly")
    func testInvalidURL() async throws {
        fakeService.fetchClosure = {
            throw NetworkError.invalidURL
        }

        let viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
            
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Invalid URL")
    }
    
    @MainActor
    @Test("ViewModel handles invalid Response")
    func testInvalidResponse() async throws {
        fakeService.fetchClosure = {
            throw NetworkError.invalidResponse
        }
        
        let viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Invalid response")
    }
    
    @MainActor
    @Test("ViewModel handles decoding errors")
    func testDecodingError() async throws {
        fakeService.fetchClosure = {
            throw NetworkError.decodingError
        }
        
        let viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Decoding error")
    }
    
    @MainActor
    @Test("ViewModel handles server errors")
    func testServerError() async throws {
        fakeService.fetchClosure = {
            throw NetworkError.serverError(500)
        }
        
        var viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Server error")
        
        fakeService.fetchClosure = {
            throw NetworkError.serverError(400)
        }
        
        viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Client error")
        
        fakeService.fetchClosure = {
            throw NetworkError.serverError(300)
        }
        
        viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Redirection error")
        
        fakeService.fetchClosure = {
            throw NetworkError.serverError(199)
        }
        
        viewModel = PhotoFeedViewModel(networkService: fakeService)
        await viewModel.fetchPhotos()
        
        #expect(viewModel.photos.isEmpty)
        #expect(viewModel.errorMessage == "Unknown error")
    }
}

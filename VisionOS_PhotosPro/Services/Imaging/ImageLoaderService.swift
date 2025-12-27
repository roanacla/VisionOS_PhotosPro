import Foundation

actor ImageLoaderService: ImageLoaderServiceProtocol {
    // NSCache is inherently thread-safe, so we can access it from nonisolated contexts.
    private let memoryCache: NSCache<NSString, NSData> = .init()
    private let persistenceDirectory: URL
    
    static let shared = ImageLoaderService()
    
    private init() {
        // 1. Setup Persistent Directory (Documents/PhotoLibrary)
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths.first!
        self.persistenceDirectory = documentsDirectory.appendingPathComponent("PhotoLibrary")
        
        // 3. Create the directory if it doesn't exist
        if !fileManager.fileExists(atPath: persistenceDirectory.path) {
            do {
                try fileManager.createDirectory(at: persistenceDirectory, withIntermediateDirectories: true)
            } catch {
                assertionFailure("Fatal Error: Could not create photo directory: \(error)")
            }
        }
    }
    
    func store(data: Data, forKey key: String) async {
        // 1. Write to Memory (Instant)
        memoryCache.setObject(data as NSData, forKey: key as NSString)
        
        // 2. Write to Disk (Background Priority)
        let fileURL = getFileURL(for: key)
        
        // We use a detached task to move heavy IO off the actor's executor
        // effectively unblocking the actor for other requests.
        Task.detached(priority: .background) {
            do {
                try data.write(to: fileURL, options: .atomic)
            } catch {
                print("Failed to save image to disk: \(error)")
            }
        }
    }
    
    // MARK: - Retrieve (Read)
    func retrieve(forKey key: String) async -> Data? {
        // 1. Check Memory (Fast Path)
        // We call the nonisolated helper to avoid context switching if possible
        if let memoryImage = retrieveFromMemory(forKey: key) {
            return memoryImage
        }
        
        // 2. Check Disk (Slow Path)
        // If not in memory, we look at the disk.
        let fileURL = getFileURL(for: key)
        
        // Check if file exists before attempting read
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            print("Failed to find image file on disk")
            return nil
        }
        
        // Perform disk read
        do {
            let data = try Data(contentsOf: fileURL)
            // 3. Hydrate Memory Cache
            // Update the memory cache so the next read is instant
            memoryCache.setObject(data as NSData, forKey: key as NSString)
            return data
        } catch {
            print("Failed to read image from disk: \(error)")
            return nil
        }
    }
    
    // MARK: - Non-isolated Helper
    // Allows synchronous access to memory cache if needed by the UI
    func retrieveFromMemory(forKey key: String) -> Data? {
        return memoryCache.object(forKey: key as NSString) as? Data
    }
    
    // MARK: - Helper
    private func getFileURL(for key: String) -> URL {
        let safeFileName = key.components(separatedBy: .punctuationCharacters).joined(separator: "_")
        return persistenceDirectory.appendingPathComponent(safeFileName)
    }
}

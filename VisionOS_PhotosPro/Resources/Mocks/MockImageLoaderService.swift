import Foundation
import UIKit

actor MockImageLoaderService: ImageLoaderServiceProtocol {
    private let dictionary: [String: String] = [
        "https://images.unsplash.com/photo-1756142752633-77b4a0302699?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo1",
        
        "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo2",
        
        "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo3",
        
        "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo4",
        
        "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo5",
        
        "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo6",
        
        "https://images.unsplash.com/photo-1762103336957-50ab747ca170?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo7",
        
        "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo8",
        
        "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200" : "Photo9",
        
        "https://images.unsplash.com/photo-1766036387999-6b4165982145?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0&q=80&w=200" : "Photo10"
    ]
    
    
    func store(data: Data, forKey: String) async {
        print("Store image data for key: \(forKey)")
    }
    
    func retrieve(forKey: String) async -> Data? {
        guard let name = dictionary[forKey], let image = UIImage(named: name) else {
            print("Error: Data asset '\(forKey)' not found")
            return nil
        }
        
        return image.pngData() ?? Data()
    }
}

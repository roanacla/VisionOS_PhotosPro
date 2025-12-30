import Foundation
import UIKit

public class MockNetworkService: NetworkServiceProtocol {
    func fetchImage(from url: URL) async throws -> Data {
        UIImage(named: "sun.max")?.pngData() ?? Data()
    }
    
    typealias DecodableType = [Photo]
    private lazy var photos: [Photo] = [
        .init(
            id: "h8hREe4gQXA",
            createdAt: "2025-08-25T17:36:54Z",
            updatedAt: "2025-12-29T19:45:11Z",
            width: 8192,
            height: 5464,
            color: "#0c260c",
            blurHash: "LDDI^er9N%$S^SM@x,xTNJoiR4NE",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1756142752633-77b4a0302699?ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1756142752633-77b4a0302699?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1756142752633-77b4a0302699?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1756142752633-77b4a0302699?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1756142752633-77b4a0302699?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/person-photographing-purple-lupine-flowers-in-a-field-h8hREe4gQXA",
                html: "https://unsplash.com/photos/person-photographing-purple-lupine-flowers-in-a-field-h8hREe4gQXA",
                download: "https://unsplash.com/photos/h8hREe4gQXA/download?ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/h8hREe4gQXA/download?ixid=M3w4NDg1OTl8MXwxfGFsbHwxfHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "PBLNyXCQ2tk",
            createdAt: "2025-10-08T15:17:37Z",
            updatedAt: "2025-12-29T17:57:41Z",
            width: 4672,
            height: 7008,
            color: "#d9d9d9",
            blurHash: "LiK-qPj[~qof_3j[M{fQWBfQIUay",
            description: "Cooltoren (or Cool Tower), Rotterdam. Designed by V8 Architects in 2016, completed in 2022. Although this building is perfectly symmetrical, as is often the case, I was stood very slightly off-centre. So here we have just half of the building, reflected and moved over to the right. This becomes evident when you take a closer look at what's in the windows. Other than that, this is exactly how it looks in real life. Fascinating engineering.",
            urls: .init(
                raw: "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1759936340143-aad257a14bf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/modern-skyscraper-against-a-clear-sky-PBLNyXCQ2tk",
                html: "https://unsplash.com/photos/modern-skyscraper-against-a-clear-sky-PBLNyXCQ2tk",
                download: "https://unsplash.com/photos/PBLNyXCQ2tk/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/PBLNyXCQ2tk/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwyfHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "5We0NIxfO-8",
            createdAt: "2025-11-23T09:22:59Z",
            updatedAt: "2025-12-29T20:01:44Z",
            width: 4685,
            height: 4685,
            color: "#f3f3f3",
            blurHash: "LoLqe9M{~qj[IUofxuWB_3ofRjof",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1763889594455-3fa4016a9e97?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/electric-guitar-and-amplifier-on-a-stage-5We0NIxfO-8",
                html: "https://unsplash.com/photos/electric-guitar-and-amplifier-on-a-stage-5We0NIxfO-8",
                download: "https://unsplash.com/photos/5We0NIxfO-8/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/5We0NIxfO-8/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwzfHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "AAWW9uFQ1hY",
            createdAt: "2025-11-19T21:22:48Z",
            updatedAt: "2025-12-29T19:31:25Z",
            width: 4500,
            height: 2682,
            color: "#c0c0c0",
            blurHash: "LrGIo:WBj[WB~qRkj[ay%Mj[ayof",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1763587239043-47e583ac0cb1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/vast-sand-dunes-under-a-cloudy-sky-AAWW9uFQ1hY",
                html: "https://unsplash.com/photos/vast-sand-dunes-under-a-cloudy-sky-AAWW9uFQ1hY",
                download: "https://unsplash.com/photos/AAWW9uFQ1hY/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/AAWW9uFQ1hY/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw0fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "12ktXGb8fS8",
            createdAt: "2025-11-25T15:04:03Z",
            updatedAt: "2025-12-29T20:01:42Z",
            width: 2376,
            height: 3575,
            color: "#d9d9d9",
            blurHash: "LrG95CxuRjt7~qt7WBoft7ayofay",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1764083029040-a803c4924d5b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/close-up-of-a-historic-building-with-spires-and-dome-12ktXGb8fS8",
                html: "https://unsplash.com/photos/close-up-of-a-historic-building-with-spires-and-dome-12ktXGb8fS8",
                download: "https://unsplash.com/photos/12ktXGb8fS8/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/12ktXGb8fS8/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw1fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "XHjYjRmYQus",
            createdAt: "2025-12-14T22:16:54Z",
            updatedAt: "2025-12-29T18:53:21Z",
            width: 3963,
            height: 4500,
            color: "#404040",
            blurHash: "LAB:vz~q?b%M?bIURjRjxuIURjj[",
            description: "Monochrome Manhattan - Shot on Sony A7IV",
            urls: .init(
                raw: "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1765750448230-11b703ba4a8e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/high-angle-view-of-new-york-city-skyscrapers-XHjYjRmYQus",
                html: "https://unsplash.com/photos/high-angle-view-of-new-york-city-skyscrapers-XHjYjRmYQus",
                download: "https://unsplash.com/photos/XHjYjRmYQus/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/XHjYjRmYQus/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw2fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "5nf4pMADaFA",
            createdAt: "2025-11-02T17:12:18Z",
            updatedAt: "2025-12-29T18:12:22Z",
            width: 3039,
            height: 3500,
            color: "#f3f3f3",
            blurHash: "L~LN.4WBRjof~qt7fQayM{t7ofay",
            description: "A boardwalk disappearing into the fog.",
            urls: .init(
                raw: "https://images.unsplash.com/photo-1762103336957-50ab747ca170?ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1762103336957-50ab747ca170?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1762103336957-50ab747ca170?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1762103336957-50ab747ca170?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1762103336957-50ab747ca170?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/a-winding-path-through-a-misty-mountainous-landscape-5nf4pMADaFA",
                html: "https://unsplash.com/photos/a-winding-path-through-a-misty-mountainous-landscape-5nf4pMADaFA",
                download: "https://unsplash.com/photos/5nf4pMADaFA/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/5nf4pMADaFA/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw3fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "Ab7yCgRb7SM",
            createdAt: "2025-10-30T15:53:21Z",
            updatedAt: "2025-12-29T16:03:40Z",
            width: 8192,
            height: 5464,
            color: "#264026",
            blurHash: "LFD9|n_3E0D%_4~pxuD%r{%N-qNF",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1761839259484-4741afbbdcbf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/family-standing-in-a-lush-green-field-with-tractor-Ab7yCgRb7SM",
                html: "https://unsplash.com/photos/family-standing-in-a-lush-green-field-with-tractor-Ab7yCgRb7SM",
                download: "https://unsplash.com/photos/Ab7yCgRb7SM/download?ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/Ab7yCgRb7SM/download?ixid=M3w4NDg1OTl8MXwxfGFsbHw4fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "qpQ832ljE8w",
            createdAt: "2025-11-28T14:28:17Z",
            updatedAt: "2025-12-29T16:24:34Z",
            width: 2828,
            height: 4242,
            color: "#262626",
            blurHash: "LHECwd-;4n4nM{?bt7xu00IUxuxu",
            description: nil,
            urls: .init(
                raw: "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1764340078980-7f3d80ac1c00?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/man-walking-in-a-modern-abstract-urban-station-qpQ832ljE8w",
                html: "https://unsplash.com/photos/man-walking-in-a-modern-abstract-urban-station-qpQ832ljE8w",
                download: "https://unsplash.com/photos/qpQ832ljE8w/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA",
                downloadLocation: "https://api.unsplash.com/photos/qpQ832ljE8w/download?ixid=M3w4NDg1OTl8MHwxfGFsbHw5fHx8fHx8fHwxNzY3MDM4NzI4fA"
            )
        ),
        .init(
            id: "1Dw-sv26nIQ",
            createdAt: "2025-12-18T05:50:17Z",
            updatedAt: "2025-12-29T18:50:18Z",
            width: 4372,
            height: 5829,
            color: "#a6a6a6",
            blurHash: "LLK_E~ofWBof?b00M{Rj%MayWBWB",
            description: "Like what you see? Follow me @thatcameraguymc",
            urls: .init(
                raw: "https://images.unsplash.com/photo-1766036387999-6b4165982145?ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0",
                full: "https://images.unsplash.com/photo-1766036387999-6b4165982145?crop=entropy&cs=srgb&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0&q=85",
                regular: "https://images.unsplash.com/photo-1766036387999-6b4165982145?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1766036387999-6b4165982145?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1766036387999-6b4165982145?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw&ixlib=rb-4.1.0&q=80&w=200"
            ),
            links: .init(
                selfLink: "https://api.unsplash.com/photos/fisherman-casting-line-on-a-stormy-beach-1Dw-sv26nIQ",
                html: "https://unsplash.com/photos/fisherman-casting-line-on-a-stormy-beach-1Dw-sv26nIQ",
                download: "https://unsplash.com/photos/1Dw-sv26nIQ/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw",
                downloadLocation: "https://api.unsplash.com/photos/1Dw-sv26nIQ/download?ixid=M3w4NDg1OTl8MHwxfGFsbHwxMHx8fHx8fHx8MTc2NzAzODcyOHw"
            )
        )
    ]
    private lazy var search: Search = .init(total: 10, totalPages: 1, results: self.photos)
    public var fetchClosure: (() throws -> Void)?
    public var isSearchEnabled: Bool = false
    
    public func fetch<T>(from request: URLRequest) async throws -> T where T : Decodable {
        try fetchClosure?()
        
        if isSearchEnabled {
            guard let result = search as? T else {
                throw MockError.typeMisMatch
            }
            return result
        } else {
            guard let result = photos as? T else {
                throw MockError.typeMisMatch
            }
            return result
        }
    }
}

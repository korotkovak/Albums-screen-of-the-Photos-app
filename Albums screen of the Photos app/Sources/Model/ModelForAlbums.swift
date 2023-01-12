//
//  ModelForAlbums.swift
//  Albums screen of the Photos app
//
//  Created by Kristina Korotkova on 12/01/23.
//

import Foundation

struct Model: Hashable {
    var title: String
    var description: String?
    var image: String?
    var imageSmall: String?
    var icon: String?
}

final class ModelForAlbums {
    static let model = [
        [Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0", icon: "heart.fill"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0"),
         Model(title: "Recents", description: "598", image: "image0")
        ],
        [Model(title: "Cерфинг", description: "Created by Kristina Korotkova", image: "image0", imageSmall: "image0"),
         Model(title: "Cерфинг", description: "Created by Kristina Korotkova", image: "image0", imageSmall: "image0"),
         Model(title: "Cерфинг", description: "Created by Kristina Korotkova", image: "image0", imageSmall: "image0"),
         Model(title: "Cерфинг", description: "Created by Kristina Korotkova", image: "image0", imageSmall: "image0"),
         Model(title: "Cерфинг", description: "Created by Kristina Korotkova", image: "image0", imageSmall: "image0")
        ],
//        [Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//         Model(title: "Videos", description: "455", image: "video"),
//        ],
//        [Model(title: "Videos", description: "455", icon: "video"),
//         Model(title: "Videos", image: "video", icon: "lock.fill"),
//         Model(title: "Videos", image: "video", icon: "lock.fill")
//        ]
    ]
}

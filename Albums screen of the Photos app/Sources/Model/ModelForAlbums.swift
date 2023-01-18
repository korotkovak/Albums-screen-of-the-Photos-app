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
        [Model(title: "Recents", description: "598",
               image: "image0"),
         Model(title: "Favorites", description: "1 598",
               image: "image3", icon: "heart.fill"),
         Model(title: "Freinds", description: "10",
               image: "image1"),
         Model(title: "WhatsApp", description: "55",
               image: "image5"),
         Model(title: "Flaffy Friends", description: "231",
               image: "image4"),
         Model(title: "Cycling", description: "78",
               image: "image6"),
         Model(title: "Family", description: "112",
               image: "image8"),
         Model(title: "Moments", description: "3",
               image: "image9"),
         Model(title: "Bali", description: "2 020",
               image: "image7"),
         Model(title: "Paris", description: "598",
               image: "image10")],
        [Model(title: "Surfing", description: "Created by Kristina Korotkova",
               image: "image11", imageSmall: "icon0"),
         Model(title: "Party", description: "Created by Maksim",
               image: "image12", imageSmall: "icon3"),
         Model(title: "Moscow", description: "Created by Me",
               image: "image13", imageSmall: "icon1"),
         Model(title: "Bali", description: "Created by Diana Antonova",
               image: "image2", imageSmall: "image1"),
         Model(title: "Paris", description: "Created by Aleksey",
               image: "image10", imageSmall: "icon2")],
        [Model(title: "Videos", description: "455",
               image: "video"),
         Model(title: "Selfies", description: "855",
               image: "person.crop.square"),
         Model(title: "Live Photos", description: "2 495",
               image: "livephoto"),
         Model(title: "Portrait", description: "1 319",
               image: "cube"),
         Model(title: "Time-lapse", description: "4",
               image: "timelapse"),
         Model(title: "Slo-mo", description: "24",
               image: "slowmo"),
         Model(title: "Screenshots", description: "817",
               image: "camera.viewfinder"),
         Model(title: "Screen Recordings", description: "32",
               image: "record.circle"),
         Model(title: "RAW", description: "12",
               image: "r.square.on.square")],
        [Model(title: "Imports", description: "1 191",
               image: "tray.and.arrow.down"),
         Model(title: "Hidden",
               image: "eye.slash", icon: "lock.fill"),
         Model(title: "Recently Deleted",
               image: "trash", icon: "lock.fill")]
    ]
}

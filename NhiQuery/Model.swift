//
//  Model.swift
//  NhiQuery
//
//  Created by KaeJer Cho on 2020/2/26.
//  Copyright © 2020 KaeJer Cho. All rights reserved.
//

import Foundation
//import RealmSwift


//
//
//class Services: Object, Decodable {
//    @objc dynamic var service_code : String?
//    @objc dynamic var service_point : String?
//    @objc dynamic var service_from : String?
//    @objc dynamic var service_to : String?
//    @objc dynamic var service_english : String?
//    @objc dynamic var service_chinese : String?
//    @objc dynamic var service_note : String?
//    @objc dynamic var service_other : String?
//
//    override class func primaryKey() -> String? {
//        return "service_code"
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case service_code
//        case service_point
//        case service_from
//        case service_to
//        case service_english
//        case service_chinese
//        case service_note
//        case service_other
//    }
//
//    public required convenience init(from decoder: Decoder) throws {
//          self.init()
//          let container = try decoder.container(keyedBy: CodingKeys.self)
//          self.service_code = try container.decode(String.self, forKey: .service_code)
//          self.service_point = try container.decode(String.self, forKey: .service_point)
//          self.service_from = try container.decode(String.self, forKey: .service_from)
//          self.service_to = try container.decode(String.self, forKey: .service_to)
//          self.service_english = try container.decode(String.self, forKey: .service_english)
//          self.service_chinese = try container.decode(String.self, forKey: .service_chinese)
//          self.service_note = try container.decode(String.self, forKey: .service_note)
//          self.service_other = try container.decode(String.self, forKey: .service_other)
//
//      }
//
//}
    

struct Service: Codable {
    var service_code:String
    var service_point:String
    var service_from:String
    var service_to:String
    var service_english:String
    var service_chinese:String
    var service_note:String
    var service_other:String
    var key:String?
}
struct DataResponse: Codable {
    var data: [Service]
}

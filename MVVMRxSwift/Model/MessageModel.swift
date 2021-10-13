import Foundation

struct MessageModel: Decodable, Identifiable{
    let id: Int
    let title: String
    let content: String
//    let attchmentList: [Obj]
    let totalComments: Int

}

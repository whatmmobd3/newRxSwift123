import Foundation


struct MessageViewModel{
    private let message: MessageModel
    
    var displayText: String{
        
//        print("*******",message)
        
        return message.title
    }
    
    init(message: MessageModel) {
        self.message = message
        
    }
}


//let id: Int
//let title: String
//let content: String
//let attachmentList: [Obj]
//let totalComments: Int

import Foundation


struct MessageViewModel{
    private let message: MessageModel
    
    var displayText: String{
        let id = String(message.content)
        return id
    }
    
    init(message: MessageModel) {
        self.message = message
        
    }
}

import Foundation
import RxSwift

final class MessageListViewModel{
//    let title = "Restaurants"
    
    private let messageService: MessageServiceProtocol
    
    init(messageService: MessageServiceProtocol = MessageService() ){
        self.messageService = messageService
    }
    
    func fetchMessageViewModel() -> Observable<[MessageViewModel]>{
        messageService.fetchMessage().map{ $0.map{
            MessageViewModel(message: $0) } }
    }
}

import Foundation
import RxSwift

protocol MessageServiceProtocol {
    func fetchMessage() -> Observable<[MessageModel]>
}

class MessageService: MessageServiceProtocol{
    func fetchMessage() -> Observable<[MessageModel]> {
        return Observable.create{ observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "messageList", ofType: "json") else{
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:
                .mappedIfSafe)
                
                let message = try JSONDecoder().decode([MessageModel].self, from: data)
                observer.onNext(message)
            }catch{
                observer.onError(error)
            }
            
            return Disposables.create { }
            
        }
    }
}

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[MessageModel]>
}

class RestaurantService: RestaurantServiceProtocol{
    func fetchRestaurants() -> Observable<[MessageModel]> {
        return Observable.create{ observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "messageList", ofType: "json") else{
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:
                .mappedIfSafe)
                
                let restaurants = try JSONDecoder().decode([MessageModel].self, from: data)
                observer.onNext(restaurants)
            }catch{
                observer.onError(error)
            }
            
            return Disposables.create { }
            
        }
    }
}

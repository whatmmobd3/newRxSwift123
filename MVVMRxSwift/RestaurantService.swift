//
//  RestaurantService.swift
//  MVVMRxSwift
//
//  Created by Loc Nguyen on 13/10/2021.
//

import Foundation
import RxSwift

class RestaurantService{
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create{ observer -> Disposable in
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else{
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options:
                .mappedIfSafe)
                
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            }catch{
                observer.onError(error)
            }
            
            return Disposables.create { }
            
        }
    }
}

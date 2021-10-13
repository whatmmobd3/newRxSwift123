import Foundation


struct RestaurantViewModel{
    private let restaurant: MessageModel
    
    var displayText: String{
        let id = String(restaurant.content)
        return id
    }
    
    init(restaurant: MessageModel) {
        self.restaurant = restaurant
        
    }
}

import Foundation


struct RestaurantViewModel{
    private let restaurant: Restaurant
    
    var displayText: String{
        return restaurant.name + " - " + restaurant.place.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        
    }
}

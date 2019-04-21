import Foundation
import MapKit

extension UserDefaults
{
    func setlocation(locs : [CLLocation], key : String)
    {
        var locsDict : [Dictionary<String,Double>] = []
        for loc in locs
        {
            let locLat : Double = Double(loc.coordinate.latitude)
            let locLon : Double = Double(loc.coordinate.longitude)
            locsDict.append(["latitude":locLat,"longitude":locLon])
        }
        self.set(locsDict,forKey: key)
    }
    
    func getlocation(key: String) -> [CLLocation]?
    {
        var locs : [CLLocation] = []
        if let locsDict = self.object(forKey: key) as? [Dictionary<String,Double>]
        {
            for locDict in locsDict
            {
                let locLat = locDict["latitude"]
                let locLon = locDict["longitude"]
                locs.append(CLLocation(latitude: CLLocationDegrees(exactly: locLat!)!, longitude: CLLocationDegrees(exactly: locLon!)!))
            }
        }
        return locs
    }
}



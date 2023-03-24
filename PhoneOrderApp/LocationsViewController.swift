//
//  LocationsViewController.swift
//  PhoneOrderApp
//
//  MAPD724 W23 iOS assignment 2 part 1
//  Created by Group 9 on 2023-03-21.
//

import UIKit
import MapKit
import CoreLocation

class LocationsViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!

    fileprivate var locationManager:CLLocationManager = CLLocationManager()
    var storeDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StoreDetailViewController") as! StoreDetailViewController

    var appleStores = [
        [
            "name": "Apple Fairview",
            "address": "1800 Sheppard Ave E, Toronto, ON M2J 5A7",
            "phone": "(416) 646-4412",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.apple.com/ca/retail/fairview/?cid=aos-ca-seo-maps",
            "lat" : "43.7778832",
            "lng" : "-79.3437891"
        ],
        [
            "name": "Apple Markville Shopping Centre",
            "address": "5000 Hwy 7, Markham, ON L3R 4M9",
            "phone": "(905) 513-2860",
            "hours": "Mon to Fri: 10:00am to 9:00pm\nSat: 10:00am to 6:00pm\nSun: 11:00am to 6:00pm",
            "website": "https://www.apple.com/ca/retail/markvilleshoppingcentre?cid=aos-ca-seo-maps",
            "lat" : "43.8683067",
            "lng" : "-79.2879519"
        ],
        [
            "name": "Jump+ - Apple Premium Retailer (Scarborough)",
            "address": "300 Borough Dr, Scarborough, ON M1P 4P5",
            "phone": "(647) 417-1434",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "http://jumpplus.com/",
            "lat" : "43.775482",
            "lng" : "-79.2570003"
        ],
        [
            "name": "Apple Eaton Centre",
            "address": "220 Yonge St, Toronto, ON M5B 2H1",
            "phone": "(647) 258-0801",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.apple.com/ca/retail/eatoncentre/?cid=aos-ca-seo-maps",
            "lat" : "43.6528195",
            "lng" : "-79.3806105"
        ],
        [
            "name": "Apple Yorkdale",
            "address": "3401 Dufferin St, Toronto, ON M6A 3A1",
            "phone": "(416) 785-1776",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.apple.com/ca/retail/yorkdale?cid=aos-ca-seo-maps",
            "lat" : "43.7242617",
            "lng" : "-79.4531191"
        ],
        [
            "name": "APPLE FIX",
            "address": "8 Glen Watford Dr Unit G27, Scarborough, ON M1S 2C1",
            "phone": "(647) 827-0205",
            "hours": "Mon to Fri: 9:30am to 5:30pm\nSat to Sun: Closed",
            "website": "http://applefix.ca/",
            "lat" : "43.7869345",
            "lng" : "-79.2762698"
        ],
        [
            "name": "Apple Sherway Gardens",
            "address": "25 The West Mall, Toronto, ON M9C 1B8",
            "phone": "(416) 646-8489",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 10:00am to 6:00pm",
            "website": "https://www.apple.com/ca/retail/sherwaygardens?cid=aos-ca-seo-maps",
            "lat" : "43.6122152",
            "lng" : "-79.5563002"
        ],
        [
            "name": "Jump+ Apple Premium Retailer (Toronto)",
            "address": "275 College St, Toronto, ON M5T 1S2",
            "phone": "(416) 927-8000",
            "hours": "Mon to Fri: 9:00am to 7:00pm\nSat: 10:00am to 5:30pm\nSun: 12:00nn to 5:00pm",
            "website": "http://www.jumpplus.com",
            "lat" : "43.6577101",
            "lng" : "-79.4006072"
        ],
        [
            "name": "Apple Square One",
            "address": "100 City Centre Dr, Mississauga, ON L5B 2C9",
            "phone": "(905) 366-0580",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.apple.com/ca/retail/squareone?cid=aos-ca-seo-maps",
            "lat" : "43.6122152",
            "lng" : "-79.5563002"
        ],
        [
            "name": "RiverdaleMac",
            "address": "345 Danforth Ave, Toronto, ON M4K 1N7",
            "phone": "(416) 778-4048",
            "hours": "Mon to Sat: 10:00am to 6:00pm\nSun: Closed",
            "website": "https://www.riverdalemac.com/",
            "lat" : "43.6771945",
            "lng" : "-79.3531491"
        ],
        [
            "name": "Jump+ Apple Premium Retailer (Vaughan Mills)",
            "address": "1 Bass Pro Mills Dr, Concord, ON L4K 5W4",
            "phone": "(289) 459-1887",
            "hours": "Mon to Sat: 10:00am to 9:00pm\nSun: 11:00am to 7:00pm",
            "website": "http://jumpplus.com/",
            "lat" : "43.8255192",
            "lng" : "-79.5407848"
        ],
        [
            "name": "BeachMac",
            "address": "1960 Queen St E #2, Toronto, ON M4L 1H8",
            "phone": "(416) 849-0694",
            "hours": "Mon to Sat: 10:00am to 6:00pm\nSun: Closed",
            "website": "https://www.riverdalemac.com/",
            "lat" : "43.669736",
            "lng" : "-79.3020569"
        ],
        [
            "name": "Apple Upper Canada Mall",
            "address": "17600 Yonge St, Newmarket, ON L3Y 4Z1",
            "phone": "(905) 952-3400",
            "hours": "Mon to Sat: 10:00am to 8:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.apple.com/ca/retail/uppercanadamall?cid=aos-ca-seo-maps",
            "lat" : "44.0557712",
            "lng" : "-79.48520409999999"
        ],
        [
            "name": "Roncesvalles Apple Specialist",
            "address": "381 Roncesvalles Ave, Toronto, ON M6R 2M8",
            "phone": "(416) 769-2775",
            "hours": "Mon to Sat: 10:00am to 8:00pm\nSun: 11:00am to 7:00pm",
            "website": "https://www.riverdalemac.com/",
            "lat" : "43.6502852",
            "lng" : "-79.4502878"
        ],
        [
            "name": "ASK Computers - iPhone & MacBook, Laptops Repair Center - Data Recovery Specalist",
            "address": "111 Front St E, Toronto, ON M5A 4S5",
            "phone": "(416) 862-9595",
            "hours": "Mon to Fri: 10:00am to 7:00pm\nSat: 11:00am to 6:00pm\nSun: Closed",
            "website": "https://www.askcomputers.ca/",
            "lat" : "43.6493817",
            "lng" : "-79.3708849"
        ],
        [
            "name": "Clickon Mac Solutions",
            "address": "212 O'Connor Dr, East York, ON M4J 2T4",
            "phone": "(416) 778-6848",
            "hours": "Mon to Fri: 10:00am to 6:00pm\nSat to Sun: Closed",
            "website": "http://www.clickonmacs.com/",
            "lat" : "43.6940015",
            "lng" : "-79.3470751"
        ],
        [
            "name": "Top Tek System",
            "address": "3000 Hwy 7 Unit A9, Markham, ON L3R 6E1",
            "phone": "(905) 604-0700",
            "hours": "Mon to Fri: 9:00am to 6:00pm\nSat to Sun: Closed",
            "website": "https://www.topteksystem.com/",
            "lat" : "43.850606",
            "lng" : "-79.35715750000001"
        ]
    ]

    var googleStores = [
        [
            "name": "Walmart Supercentre",
            "address": "3850 Sheppard Ave E, Scarborough, ON M1T 3L3",
            "phone": "416-291-4100",
            "hours": "Mon to Sun: 07:00am to 10:00pm",
            "website": "4.5",
            "lat" : "43.784525823778246",
            "lng" : "-79.29092478140788"
        ],
        [
            "name": "Walmart Supercentre",
            "address": "5995 Steeles Ave E, Scarborough, ON M1V 5P7",
            "phone": "416-298-1210",
            "hours": "Mon to Sat: 07:00am to 10:00pm",
            "website": "4.0",
            "lat" : "43.83463110602688",
            "lng" : "-79.25501429627249"
        ],
        [
            "name": "The Source",
            "address": "3495 Lawrence Ave E Unit #CB025 Cedarbrae Mall, Entrance #1, Scarborough, ON M1H 1B3",
            "phone": "416-298-1210",
            "hours": "Mon to Sun: 10:00am to 09:00pm\nSun: 12:00pm to 5:00pm",
            "website": "4.5",
            "lat" : "43.763374692027085",
            "lng" : "-79.22741946870741"
        ]
    ]

    var samsumgStores = [
        [
            "name": "Value Mobile",
            "address": "Chartwell, 2301 Brimley Rd, Scarborough, ON M1S 3L6",
            "phone": "416-782-7271",
            "hours": "Mon to Sat: 11:00am to 8:00pm\nSun: 11:00am to 6:00pm",
            "website": "4.0",
            "lat" : "43.798918880980814",
            "lng" : "-79.2713251321897"
        ],
        [
            "name": "Costco Wholesale",
            "address": "1411 Warden Ave., Toronto, ON M1R 2S3",
            "phone": "416-288-0033",
            "hours": "Mon to Fri: 09:00am to 8:30pm\nSat to Sun: 09:00am to 6:00pm",
            "website": "4.5",
            "lat" : "43.761908434683015",
            "lng" : "-79.29742545717633"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()

        mapView.showsUserLocation = true

        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 20000, longitudinalMeters: 20000)
            mapView.setRegion(viewRegion, animated: true)
        }

        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.normal)
        segmentedControl.selectedSegmentIndex = 0;
        segmentedControl.sendActions(for: UIControl.Event.valueChanged)

    }

    // Show the custom pins on the map and make the pins clickable
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationIdentifier") as? MKPinAnnotationView
        if !(annotation is MKUserLocation) {
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationIdentifier")
            } else {
                annotationView?.annotation = annotation
            }

            if let annotation = annotation as? MyPointAnnotation {
                annotationView?.canShowCallout = true
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
                annotationView?.pinTintColor = annotation.pinTintColor
            }
        }
        return annotationView
    }

    // Show the bottom sheet when the pin action button is clicked
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        //guard let storesAnnotation = view.annotation as? MyPointAnnotation else { return }
        if let storeAnnotation = view.annotation as? MyPointAnnotation {
            storeDetailVC.store.copy(original: storeAnnotation)
            if let sheet = storeDetailVC.sheetPresentationController {
                if #available(iOS 16.0, *) {
                    sheet.detents = [.custom { context in
                        return context.maximumDetentValue * 0.4
                    },]
                } else {
                    // Fallback on earlier versions
                    sheet.detents = [.medium()]
                }
                sheet.prefersGrabberVisible = true
            }
            self.present(storeDetailVC, animated: true, completion: nil)
        }
    }

    // Handle the segmented button action. Change stores accrodingly
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            showStoresAnnotations(stores: appleStores, color: UIColor.red)
        case 1:
            showStoresAnnotations(stores: googleStores, color: UIColor.purple)
        case 2:
            showStoresAnnotations(stores: samsumgStores, color: UIColor.darkGray)
        default:
        break;
        }
    }

    // Put the pins according to the json store coordinates with specific color
    func showStoresAnnotations(stores: [[String: String]], color: UIColor) {
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)

        for store in stores {
            if let name = store["name"], let lat = store["lat"], let lng = store["lng"] {
                let pin = MyPointAnnotation(pinTintColor: color, name: name, address: store["address"]!, phone: store["phone"]!, hours: store["hours"]!, website: store["website"]!)
                pin.coordinate = CLLocationCoordinate2D(latitude: Double(lat)!, longitude: Double(lng)!)
                pin.title = name
                mapView.addAnnotation(pin)
            }
        }
    }

}

class MyPointAnnotation : MKPointAnnotation {

    var pinTintColor: UIColor
    var name: String
    var address: String
    var phone: String
    var hours: String
    var website: String

    init(pinTintColor: UIColor = UIColor.black,
            name: String = "",
            address: String = "",
            phone: String = "",
            hours: String = "",
            website: String = ""
    ) {
        self.pinTintColor = pinTintColor
        self.name = name
        self.address = address
        self.phone = phone
        self.hours = hours
        self.website = website
    }

    func copy(original: MyPointAnnotation) {
        self.pinTintColor = original.pinTintColor
        self.name = original.name
        self.address = original.address
        self.phone = original.phone
        self.hours = original.hours
        self.website = original.website
    }
}

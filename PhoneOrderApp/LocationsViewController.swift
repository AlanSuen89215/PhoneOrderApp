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
            "name": "STC Apple Store",
            "address": "300 Borough Dr, Scarborough, ON M1P 4P5",
            "phone": "416-123-4567",
            "hours": "Mon to Sat: 10:00am to 8:00pm\nSun: 10:00am to 6:00pm",
            "rating": "3.5",
            "lat" : "43.77550067523209",
            "lng" : "-79.25780287315973"
        ],
        [
            "name": "Markville Apple Store",
            "address": "5000 Hwy 7, Markham, ON L3R 4M9",
            "phone": "905-889-7711",
            "hours": "Mon to Sat: 10:00am to 7:00pm",
            "rating": "4.5",
            "lat" : "43.87033676618933",
            "lng" : "-79.2872004866518"
        ]
    ]

    var googleStores = [
        [
            "name": "Walmart Supercentre",
            "address": "3850 Sheppard Ave E, Scarborough, ON M1T 3L3",
            "phone": "416-291-4100",
            "hours": "Mon to Sun: 07:00am to 10:00pm",
            "rating": "4.5",
            "lat" : "43.784525823778246",
            "lng" : "-79.29092478140788"
        ],
        [
            "name": "Walmart Supercentre",
            "address": "5995 Steeles Ave E, Scarborough, ON M1V 5P7",
            "phone": "416-298-1210",
            "hours": "Mon to Sat: 07:00am to 10:00pm",
            "rating": "4.0",
            "lat" : "43.83463110602688",
            "lng" : "-79.25501429627249"
        ],
        [
            "name": "The Source",
            "address": "3495 Lawrence Ave E Unit #CB025 Cedarbrae Mall, Entrance #1, Scarborough, ON M1H 1B3",
            "phone": "416-298-1210",
            "hours": "Mon to Sun: 10:00am to 09:00pm\nSun: 12:00pm to 5:00pm",
            "rating": "4.5",
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
            "rating": "4.0",
            "lat" : "43.798918880980814",
            "lng" : "-79.2713251321897"
        ],
        [
            "name": "Costco Wholesale",
            "address": "1411 Warden Ave., Toronto, ON M1R 2S3",
            "phone": "416-288-0033",
            "hours": "Mon to Fri: 09:00am to 8:30pm\nSat to Sun: 09:00am to 6:00pm",
            "rating": "4.5",
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
                let pin = MyPointAnnotation(pinTintColor: color, name: name, address: store["address"]!, phone: store["phone"]!, hours: store["hours"]!, rating: store["rating"]!)
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
    var rating: String

    init(pinTintColor: UIColor = UIColor.black,
            name: String = "",
            address: String = "",
            phone: String = "",
            hours: String = "",
            rating: String = ""
    ) {
        self.pinTintColor = pinTintColor
        self.name = name
        self.address = address
        self.phone = phone
        self.hours = hours
        self.rating = rating
    }

    func copy(original: MyPointAnnotation) {
        self.pinTintColor = original.pinTintColor
        self.name = original.name
        self.address = original.address
        self.phone = original.phone
        self.hours = original.hours
        self.rating = original.rating
    }
}

//
//  IndicatorEx.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/04/29.
//

import UIKit
import NMapsMap

class IndicatorEx : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let naverMapView = NMFMapView(frame: view.frame)
        
        naverMapView.mapType = .basic
        view.addSubview(naverMapView)
        naverMapView.symbolScale = 0.78
        naverMapView.positionMode = .disabled
        let status = CLLocationManager.authorizationStatus()
        
        if status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            
            print("위치권한 꺼져있음")
            
            
            
        }
            
        else if status == CLAuthorizationStatus.authorizedWhenInUse {
            
            print("위치권한 켜져있음")
            
            
            
        }
        
        let locationOverlay = naverMapView.locationOverlay
        locationOverlay.hidden = false
        //        locationOverlay.location = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        locationOverlay.icon = NMFOverlayImage(name: "user.png")
//        print(locationOverlay.location)
        let marker = NMFMarker()
        
        //마커찍기
        marker.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        marker.captionText = "Hello"
        marker.mapView = naverMapView
        
//        print(marker.position)
        //        naverMapView.showCompass = false
        //        naverMapView.com
        //        naverMapView.showLocationButton = true
        //        naverMapView.position
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.5670135, lng: 126.9783740))
        naverMapView.moveCamera(cameraUpdate)
        print("center")
        print(naverMapView.cameraPosition.tilt)
        
    }
    //    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
    //        print("\(latlng.lat), \(latlng.lng)")
    //    }
    
    
}

extension IndicatorEx : NMFMapViewTouchDelegate{
    //    private func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
    //        print("\(latlng.lat), \(latlng.lng)")
    //    }
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
//        print("\(latlng.lat), \(latlng.lng)")
        print("Test")
        //    }
    }
}

//
//  Model.swift
//  FineDustCast
//
//  Created by Chunsu Kim on 20/06/2019.
//  Copyright © 2019 Chunsu Kim. All rights reserved.
//

import Foundation
import CoreLocation

struct AirMesureSidoLIst: Codable {
    struct List: Codable {
        let cityName: String    // 도시명
        let cityNameEng: String // 도시명 영문
        let coValue: String // 일산화탄소 농도
        let districtCode: String
        let districtNumSeq: String
        let no2Value: String    // 이산화질소 농도
        let o3Value: String // 오존 농도
        let pm10Value: String   // 미세먼지 pm10 농도
        let pm25Value: String   // 미세먼지 pm2.5 농도
        let resultCode: String  // 결과코드
        let resultMsg: String   // 결과메세지
        let sidoName: String    // 시도명
        let so2Value: String    // 아황산가스 농도
    }
    
    let list: [List]
}

class AirMesureDataSource {
    static let shared = AirMesureDataSource()
    
    private init() {}
    
    var sidoList: AirMesureSidoLIst?
    
    let group = DispatchGroup()
    let workQueue = DispatchQueue(label: "apiQueue", attributes: .concurrent)
    
    func fetch(location: CLLocation, completion: @escaping () -> ()) {
        group.enter()
        workQueue.async {
            self.fetchAirMesureSidoList(lat: location.coordinate.latitude, lon: location.coordinate.longitude, completion: {
                self.group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main) {
            completion()
        }
    }
    
    func fetchAirMesureSidoList(lat: Double, lon: Double, completion: @escaping () -> ()) {
        
        let sidoNameKo = "서울"
        
        let queryEncodedStr = sidoNameKo.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let ConvertedSidoName = URL(string: queryEncodedStr)!
        print(ConvertedSidoName)
        
        let apiUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?serviceKey=\(serviceKey)&numOfRows=10&pageNo=1&sidoName=\(ConvertedSidoName)&searchCondition=DAILY&_returnType=json"
        
        
        guard let url = URL(string: apiUrl) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            defer {
                DispatchQueue.main.async {
                    completion()
                }
            }
            
            if let error = error {
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print(httpResponse.statusCode)
                return
            }
            
            guard let data = data else {
                fatalError("Invalid response")
            }
            
            do {
                let decoder = JSONDecoder()
                self.sidoList = try decoder.decode(AirMesureSidoLIst.self, from: data)
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

import UIKit

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
        let resultCode: String
        let resultMsg: String
        let sidoName: String    // 시도명
        let so2Value: String    // 아황산가스 농도
    }
    
    let list: [List]
}

let serviceKey = "%2FffRqTD2TVNUzBaIQmPtKeIxBEUQWZQw4Ih4a7%2BODUFra9qhxr1Z3pD2izuPYrctX7%2B60ep97I2h1MNMVuJMqw%3D%3D"

let sidoname = "서울" // 시도 이름 (서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)

let queryEncodedStr = sidoname.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
let sidoName = URL(string: queryEncodedStr)!
print(sidoName)

let searchCondition = "HOUR"    // 요청데이터기간 (시간 : HOUR, 하루 : DAILY)

//let apiUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?serviceKey=%2FffRqTD2TVNUzBaIQmPtKeIxBEUQWZQw4Ih4a7%2BODUFra9qhxr1Z3pD2izuPYrctX7%2B60ep97I2h1MNMVuJMqw%3D%3D&numOfRows=10&pageNo=1&sidoName=%EC%84%9C%EC%9A%B8&searchCondition=DAILY&_returnType=json"

let apiUrl = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?serviceKey=\(serviceKey)&numOfRows=10&pageNo=1&sidoName=\(sidoName)&searchCondition=\(searchCondition)&_returnType=json"

let url = URL(string: apiUrl)!

let session = URLSession.shared

let task = session.dataTask(with: url) { (data, response, error) in
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
        fatalError("Invalid Data")
    }
    
    do {
        let decoder = JSONDecoder()
        let sidoList = try decoder.decode(AirMesureSidoLIst.self, from: data)
        
        sidoList.list.first?.resultCode
        sidoList.list.first?.resultMsg
        
        sidoList.list.first?.sidoName
        sidoList.list.first?.cityName
        sidoList.list.first?.cityNameEng
        sidoList.list.first?.districtCode
        sidoList.list.first?.districtNumSeq
        
        sidoList.list.first?.coValue
        sidoList.list.first?.no2Value
        sidoList.list.first?.o3Value
        sidoList.list.first?.pm10Value
        sidoList.list.first?.pm25Value
        sidoList.list.first?.so2Value
        
    } catch {
        print(error)
    }
}

task.resume()

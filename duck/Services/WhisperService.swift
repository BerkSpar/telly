//
//  WhisperService.swift
//  duck
//
//  Created by Felipe Passos on 24/08/23.
//

import Foundation
import Alamofire

class WhisperService {
    func listen(completion: @escaping (Result<String, Error>) -> Void) async {
        let url = "https://pokeapi.co/api/v2/pokemon/pikachu"
                
        AF.request(url).validate().responseString { response in
            switch response.result {
            case .success(let dataString):
                completion(.success(dataString))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

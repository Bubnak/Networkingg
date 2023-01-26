//
//  QuestionsModel.swift
//  TopQuestions
//
//  Created by Matteo Manferdini on 04/02/21.
//

import Foundation

public class QuestionsDataManager {
    
    public init() {
        
    }
    public (set) var questions: [Movie]? = []
	public var request: APIRequest<QuestionsResource>?
    public var imageRequest: ImageRequest?
    
    public func fetchTopQuestions(withCompletion completion: @escaping ([Movie]?) -> Void) {
		let resource = QuestionsResource()
		let request = APIRequest(resource: resource)
		self.request = request
		request.execute { [weak self] (questions, error) in
			self?.questions = questions ?? []
			
            completion(questions)
		}
	}
}

 extension QuestionsDataManager {
     public func loadOwnerAvatar(withUrl: String, completion: @escaping (Data?, Error?) -> Void) {
        
       guard let url =  URL(string: withUrl) else { return }
        let imageRequest = ImageRequest(url: url)
        self.imageRequest = imageRequest
        imageRequest.execute { [weak self] (image,error) in
            completion(image, error)
           // self?.question.owner?.profileImage = image
        }
    }
}

// MARK: - QuestionsResource
struct QuestionsResource: APIResource {
    
    typealias ModelType = Movie
    public var id: Int?
    
    public var methodPath: String {
        guard let id = id else {
            return ""
          //  return "/questions"
        }
        return ""
       // return "/questions/\(id)"
    }
    
    public var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "apikey", value: "b9bd48a6"),
            URLQueryItem(name: "s", value: "Marvel"),
            URLQueryItem(name: "type", value: "movie")
           
        ]
    public var filter: String? {
        id != nil ? "!9_bDDxJY5" : nil
    }
    
    public var parameters: [String : Any]? = [
        "request": [
        "xusercode" : "YOUR USERCODE HERE",
        "xpassword": "YOUR PASSWORD HERE"
         ]
     ]
}

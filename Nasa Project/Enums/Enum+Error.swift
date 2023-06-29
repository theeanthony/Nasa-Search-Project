//
//  Enum+Error.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//

import Foundation
import SwiftUI

enum FetchStatus {
    case AllGood, BadRequest, NotFound, ServerError,
         UnknownError, FailedDecodeResponseData, FailedToEncode, InvalidURL, NetworkError, InvalidResponse, Empty,ExceedPageLimit
    
    var message: String {
        switch self {
        case .AllGood:
            return "Fetch successful!"
        case .BadRequest:
            return "Bad request"
        case .NotFound:
            return "Resource not found"
        case .ServerError:
            return "Server error"
        case .UnknownError:
            return "Unknown error occurred"
        case .FailedDecodeResponseData:
            return "Failed to decode response data"
        case .FailedToEncode:
            return "Failed to encode request data"
        case .InvalidURL:
            return "Invalid URL"
        case .NetworkError:
            return "Network error"
        case .InvalidResponse:
            return "Invalid response received"
        case .ExceedPageLimit:
            return "Exceeded Page limit"
            
        case .Empty:
            return "There are no results that match your search. Try again."
        }
    }
    var backgroundColor: UIColor {
         switch self {
         case .AllGood:
             return UIColor.green
         case .BadRequest, .NotFound, .ServerError, .UnknownError, .FailedDecodeResponseData, .FailedToEncode, .InvalidURL, .NetworkError, .InvalidResponse, .Empty,.ExceedPageLimit:
             return UIColor.red
         }
     }
    func showAlert() -> Text {
        return  Text(self.message).foregroundColor(.white).font(.largeTitle)
    }
    
}

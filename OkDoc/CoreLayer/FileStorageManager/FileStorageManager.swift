//
//  FileStorageManager.swift
//  OkDoc
//
//  Created by workmachine on 03.06.2018.
//  Copyright © 2018 Beslan Tularov. All rights reserved.
//

import Photos
import MobileCoreServices
import AVFoundation

class FileStorageManager {
	class func createPath(path: String) {
		let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
		if let pathURL = URL.init(string: paths[0]) {
			let dataURL = pathURL.appendingPathComponent(path)
			do {
				try FileManager.default.createDirectory(atPath: dataURL.absoluteString,
														withIntermediateDirectories: true,
														attributes: nil)
			} catch let error as NSError {
				print(error.localizedDescription);
			}
		} else {
			print("Error in getting path URL");
		}
	}
	
	class func saveFileby(type: FileType, directory: Directory, url: URL, complation: @escaping (Bool, Error?, String) -> ()) {
		DispatchQueue.global(qos: .background).async {
			if let urlData = NSData(contentsOf: url) {
				let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
				let filePath="\(documentsPath)/\(directory)/\(url.lastPathComponent).\(type)"
				let fileName = "\(url.lastPathComponent).\(type)"
				DispatchQueue.main.async {
					urlData.write(toFile: filePath, atomically: true)
					PHPhotoLibrary.shared().performChanges({
						PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
					}) { completed, error in
						complation(completed, error, fileName)
					}
				}
			}
		}
	}
	
	class func urlFrom(directory: Directory, and fileName: String) -> URL {
		let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
		let filePath="\(documentsPath)/\(directory)/\(fileName)"
		let url = URL.init(fileURLWithPath: filePath)
		return url
	}
}

enum Directory: String {
	case Videos
	case Audios
}

enum FileType: String {
	case mp4
	case mp3
}

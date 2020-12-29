//
//  JSONViewController.swift
//  patelNew
//
//  Created by PNBS05 on 21/11/20.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

class JSONViewController: UIViewController {
   
        @IBOutlet var mytableview: UITableView!
    var arr: [JSONModel] = [JSONModel]()
        var arr_name = [String]()
        var arr_image = [String]()
  
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        self.mytableview.delegate = self
          self.mytableview.dataSource = self
            getdata()
        }
        
       // func createArray() -> [MyResponse] {
            
            //UIImageView.load(urlString: urlKey)
            
            
            
    func getdata() {
        
            
        let myapiurl = "http://prasarbharati.org/pb/jsonfiles/generalapiv2.json"
        
        AF.request(myapiurl, method: .get).responseJSON { [self] (AFdata) in
            switch AFdata.result {
            
            case .success(let data) :
               // print(data)
                
                let json = JSON(data)
               
             //   self.arr_image.removeAll()
              //  self.arr_name.removeAll()
                
              //  print(json)
                
                
                for index in 0...json.count-1 {
                
                    print("\(json[index]["slides"])")
                    
                    let mydata = ("\(json[index]["slides"])")
                    
                  //  filterdata = mydata.flatMap($0.image)
                  //  print(filterdata)
                    let cat_name = ("\(json[index]["slides"][0]["name"])")
                     let cat_image = ("\(json[index]["slides"][0]["image"])")
                    
                    self.arr_name.append(cat_name)
                    self.arr_image.append(cat_image)
                    
                  //  let url = URL(string: //"https://prasarbharati.org/pb/jsonfiles/generalapiv2.json")
                //    imageOne.kf.setImage(with: url)
                }
                self.mytableview.reloadData()
             
       
                break
            case .failure:
               print("error")
               break
            }
        
            
            
            
            
            
            
        }
        }
    }

    extension JSONViewController: UITableViewDelegate, UITableViewDataSource {
        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arr_name.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
            
            cell?.nameLabel.text = arr_name[indexPath.row]
           // cell?.textLabel?.text = arr_image[indexPath.row]
          //  cell?.textLabel?.text = arr_name[indexPath.row]
            let imgURL = URL(string: arr_image[indexPath.row])
            
            if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell?.imageOne.image = UIImage(data: data as! Data)
            }
            
            
            return cell!
        }
        
        
        
    }



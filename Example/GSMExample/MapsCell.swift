//
//  Cell.swift
//  GSMExample
//
//  Created by Allan Vialatte on 12/01/2018.
//  Copyright © 2018 Allan Vialatte. All rights reserved.
//

import UIKit
import Kingfisher
import GoogleStaticMapsKit

class MapsCell: UITableViewCell {
  
  @IBOutlet weak var ibImageView: UIImageView!
  @IBOutlet weak var ibLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func load(with gsm: GoogleStaticMaps, and text: String) {
    guard let url = gsm.toURL else { return }
    self.ibImageView.kf.setImage(with: ImageResource(downloadURL: url))
    self.ibLabel.text = text
    print("URL of \(text): ---------")
    print("\(url.absoluteString)")
    print("---------------")
  }
  
}

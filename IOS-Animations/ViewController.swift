/*
 to animate multiplier you have deactive and replace the constraint entirely.
*/

import UIKit

class ViewController: UIViewController {
  
  var v1CenterX: NSLayoutConstraint!
  var v1CenterY: NSLayoutConstraint!
  var v1Width: NSLayoutConstraint!
  var v1Height: NSLayoutConstraint!
  
  var v2CenterX: NSLayoutConstraint!
  var v2CenterY: NSLayoutConstraint!
  var v2Width: NSLayoutConstraint!
  var v2Height: NSLayoutConstraint!
  
  var v3CenterX: NSLayoutConstraint!
  var v3CenterY: NSLayoutConstraint!
  var v3Width: NSLayoutConstraint!
  var v3Height: NSLayoutConstraint!
  
  var v4CenterX: NSLayoutConstraint!
  //  var v4CenterY: NSLayoutConstraint!
  var v4Bottom: NSLayoutConstraint!
  var v4Width: NSLayoutConstraint!
  var v4Height: NSLayoutConstraint!
  
  let v1: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    return v
  }()
  
  let v2: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    return v
  }()
  
  let v3: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    return v
  }()
  
  let v4: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    return v
  }()
  
  
  var button1: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle("animate 1", for: .normal)
    b.setTitleColor(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), for: .normal)
    return b
  }()
  
  var button2: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle("animate 2", for: .normal)
    b.setTitleColor(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), for: .normal)
    return b
  }()
  
  var button3: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    b.setTitle("animate 3", for: .normal)
    b.setTitleColor(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), for: .normal)
    return b
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  func setupViews(){
    view.addSubview(self.v1)
    addV1Constrants()
    view.addSubview(self.v2)
    addV2Constrants()
    view.addSubview(self.v3)
    addV3Constrants()
    
    view.addSubview(self.v4)
    addV4Constrants()
    view.addSubview(button1)
    button1.addTarget(self, action: #selector(self.handleButton1Click), for: .touchUpInside)
    addButton1Constraint()
    view.addSubview(button2)
    addButton2Constraint()
    button2.addTarget(self, action: #selector(self.handleButton2Click), for: .touchUpInside)
    
    view.addSubview(button3)
    addButton3Constraint()
    button2.addTarget(self, action: #selector(self.handleButton3Click), for: .touchUpInside)
  }
  
  @objc func handleButton1Click(){
    // animate constants v1CenterX, v1Centery , hight or width ( expreminent )
    
    
    v2Height?.constant = v2Height?.constant == 100 ? 200 : 100
    v2Width?.constant = v2Width?.constant == 100 ? 200 : 100
    view.layoutIfNeeded() // this will not animate
    
    // this will animate
    v3CenterY?.constant = v3CenterY?.constant == 0 ? -150 : 0
    
    // toggle height and width k
    v1Height?.constant = v1Height?.constant == 100 ? 200 : 100
    v1Width?.constant = v1Width?.constant == 100 ? 200 : 100
    // when a constraint is changed the view will be marked as needing an update.
    
    UIView.animate(withDuration: 0.33, animations: {
      
      self.view.layoutIfNeeded()
      
      // this
      let angel:CGFloat = self.v1Height?.constant != 100 ? .pi / 4 : 0
      self.v1.transform = CGAffineTransform(rotationAngle: angel)
      
    }, completion: nil)
    
  }
  
  @objc func handleButton2Click(){
    v4Bottom.constant = -200
    button2.isUserInteractionEnabled = false
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
      self.view.layoutIfNeeded()
    }) { (success) in
      self.v4Bottom.constant =  150
      UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
        self.view.layoutIfNeeded()
      }, completion: { (success) in
        self.button2.isUserInteractionEnabled = true
      })
    }
    
  }
  
  @objc func handleButton3Click(){
  }
  
  func addV1Constrants(){
    v1CenterX = v1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
    v1CenterY = v1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
    
    v1Width = v1.widthAnchor.constraint(equalToConstant: 100)
    v1Height = v1.heightAnchor.constraint(equalToConstant: 100)
    
    v1CenterX.isActive = true
    v1CenterY.isActive = true
    v1Width.isActive = true
    v1Height.isActive = true
  }
  
  func addV2Constrants(){
    v2CenterX = v2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150)
    v2CenterY = v2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
    
    v2Width = v2.widthAnchor.constraint(equalToConstant: 100)
    v2Height = v2.heightAnchor.constraint(equalToConstant: 100)
    
    v2CenterX.isActive = true
    v2CenterY.isActive = true
    v2Width.isActive = true
    v2Height.isActive = true
  }
  
  func addV3Constrants(){
    v3CenterX = v3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150)
    v3CenterY = v3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150)
    
    v3Width = v3.widthAnchor.constraint(equalToConstant: 100)
    v3Height = v3.heightAnchor.constraint(equalToConstant: 100)
    
    NSLayoutConstraint.activate([ v3CenterY!, v3CenterX!, v3Width!, v3Height! ])
  }
  
  func addV4Constrants(){
    v4CenterX = v4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
    v4Bottom = v4.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 150)
    v4Width =  v4.widthAnchor.constraint(equalToConstant: 100)
    v4Height =  v4.heightAnchor.constraint(equalToConstant: 100)
    NSLayoutConstraint.activate([v4CenterX,v4Bottom, v4Width, v4Height ])
  }
  
  func addButton1Constraint(){
    button1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
    button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
    button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func addButton2Constraint(){
    button2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100).isActive = true
    button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    button2.widthAnchor.constraint(equalToConstant: 100).isActive = true
    button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  func addButton3Constraint(){
    button3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
    button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
  }
  

}


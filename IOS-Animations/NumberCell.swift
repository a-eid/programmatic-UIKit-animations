import UIKit

let numberCell = "NUMBER_CELL"

class NumberCell: UICollectionViewCell {
  
  let button: UIButton = {
    let b = UIButton()
    b.translatesAutoresizingMaskIntoConstraints = false
    return b
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
//    translatesAutoresizingMaskIntoConstraints = false
//    widthAnchor.constraint(equalToConstant: 100).isActive = true
//    heightAnchor.constraint(equalToConstant: 100).isActive = true
    backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    setupViews()
  }
  
  func setupViews(){
    addSubview(button)
    setupButtonConstraints()
  }
  
  func updateViews(n: Int){
    button.setTitle( String(n), for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), for: .normal)
  }
  
  func setupButtonConstraints(){
    button.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    button.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
    button.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

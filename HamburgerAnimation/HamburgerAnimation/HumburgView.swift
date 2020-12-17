//
//  HumburgView.swift
//
//  Code generated using QuartzCode 1.39.16 on 2016/10/24.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class HumburgView: UIView,CAAnimationDelegate {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let oval = CAShapeLayer()
		self.layer.addSublayer(oval)
		layers["oval"] = oval
		
		let centerLine = CAShapeLayer()
		self.layer.addSublayer(centerLine)
		layers["centerLine"] = centerLine
		
		let upLine = CAShapeLayer()
		self.layer.addSublayer(upLine)
		layers["upLine"] = upLine
		
		let downLine = CAShapeLayer()
		self.layer.addSublayer(downLine)
		layers["downLine"] = downLine
		
		resetLayerPropertiesForLayerIdentifiers(nil)
		setupLayerFrames()
	}
	
	func resetLayerPropertiesForLayerIdentifiers(_ layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("oval"){
			let oval = layers["oval"] as! CAShapeLayer
			oval.lineCap     = kCALineCapRound
			oval.fillColor   = nil
			oval.strokeColor = UIColor(red:0.127, green: 0.598, blue:0.198, alpha:1).cgColor
			oval.lineWidth   = 11
		}
		if layerIds == nil || layerIds.contains("centerLine"){
			let centerLine = layers["centerLine"] as! CAShapeLayer
			centerLine.lineCap     = kCALineCapRound
			centerLine.fillColor   = nil
			centerLine.strokeColor = UIColor(red:0.125, green: 0.6, blue:0.196, alpha:1).cgColor
			centerLine.lineWidth   = 11
			centerLine.strokeEnd   = 0
		}
		if layerIds == nil || layerIds.contains("upLine"){
			let upLine = layers["upLine"] as! CAShapeLayer
			upLine.anchorPoint = CGPoint(x: 1, y: 1)
			upLine.setValue(-45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
			upLine.lineCap     = kCALineCapRound
			upLine.fillColor   = nil
			upLine.strokeColor = UIColor(red:0.125, green: 0.6, blue:0.196, alpha:1).cgColor
			upLine.lineWidth   = 11
		}
		if layerIds == nil || layerIds.contains("downLine"){
			let downLine = layers["downLine"] as! CAShapeLayer
			downLine.anchorPoint = CGPoint(x: 1, y: 1)
			downLine.setValue(45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
			downLine.lineCap     = kCALineCapRound
			downLine.fillColor   = nil
			downLine.strokeColor = UIColor(red:0.125, green: 0.6, blue:0.196, alpha:1).cgColor
			downLine.lineWidth   = 11
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let oval : CAShapeLayer = layers["oval"] as? CAShapeLayer{
			oval.frame = CGRect(x: 0.1025 * oval.superlayer!.bounds.width, y: 0.115 * oval.superlayer!.bounds.height, width: 0.8 * oval.superlayer!.bounds.width, height: 0.8 * oval.superlayer!.bounds.height)
			oval.path  = ovalPathWithBounds((layers["oval"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let centerLine : CAShapeLayer = layers["centerLine"] as? CAShapeLayer{
			centerLine.frame = CGRect(x: 0.24432 * centerLine.superlayer!.bounds.width, y: 0.115 * centerLine.superlayer!.bounds.height, width: 0.66395 * centerLine.superlayer!.bounds.width, height: 0.4 * centerLine.superlayer!.bounds.height)
			centerLine.path  = centerLinePathWithBounds((layers["centerLine"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let upLine : CAShapeLayer = layers["upLine"] as? CAShapeLayer{
			upLine.transform = CATransform3DIdentity
			upLine.frame     = CGRect(x: 0.245 * upLine.superlayer!.bounds.width, y: 0.375 * upLine.superlayer!.bounds.height, width: 0.4 * upLine.superlayer!.bounds.width, height: 0)
			upLine.setValue(-45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
			upLine.path      = upLinePathWithBounds((layers["upLine"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let downLine : CAShapeLayer = layers["downLine"] as? CAShapeLayer{
			downLine.transform = CATransform3DIdentity
			downLine.frame     = CGRect(x: 0.245 * downLine.superlayer!.bounds.width, y: 0.655 * downLine.superlayer!.bounds.height, width: 0.4 * downLine.superlayer!.bounds.width, height: 0)
			downLine.setValue(45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
			downLine.path      = downLinePathWithBounds((layers["downLine"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addAllAnimation(){
		addAllAnimationCompletionBlock(nil)
	}
	
	func addAllAnimationCompletionBlock(_ completionBlock: ((_ finished: Bool) -> Void)?){
		addAllAnimationReverse(false, totalDuration:0.993, endTime:1, completionBlock:completionBlock)
	}
	
	func addAllAnimationReverse(_ reverseAnimation: Bool, totalDuration: CFTimeInterval, endTime: CFTimeInterval, completionBlock: ((_ finished: Bool) -> Void)?){
		let endTime = endTime * totalDuration
		
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = endTime
			completionAnim.delegate = self
			completionAnim.setValue("all", forKey:"animId")
			completionAnim.setValue(true, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"all")
			if let anim = layer.animation(forKey: "all"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		if !reverseAnimation{
			setupLayerFrames()
			resetLayerPropertiesForLayerIdentifiers(["oval", "centerLine", "upLine", "downLine"])
		}
		
		let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
		
		////Oval animation
		let ovalStrokeEndAnim            = CABasicAnimation(keyPath:"strokeEnd")
		ovalStrokeEndAnim.fromValue      = 1;
		ovalStrokeEndAnim.toValue        = -0.1;
		ovalStrokeEndAnim.duration       = 1 * totalDuration / 2
		ovalStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var ovalAllAnim : CAAnimationGroup = QCMethod.groupAnimations([ovalStrokeEndAnim], fillMode:fillMode)
		if (reverseAnimation){ ovalAllAnim = QCMethod.reverseAnimation(ovalAllAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		layers["oval"]?.add(ovalAllAnim, forKey:"ovalAllAnim")
		
		////CenterLine animation
		let centerLineStrokeEndAnim            = CABasicAnimation(keyPath:"strokeEnd")
		centerLineStrokeEndAnim.fromValue      = 0;
		centerLineStrokeEndAnim.toValue        = 1;
		centerLineStrokeEndAnim.duration       = 0.406 * totalDuration
		centerLineStrokeEndAnim.beginTime      = 0.369 * totalDuration
		centerLineStrokeEndAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		let centerLineStrokeStartAnim       = CABasicAnimation(keyPath:"strokeStart")
		centerLineStrokeStartAnim.fromValue = 0;
		centerLineStrokeStartAnim.toValue   = 0.69;
		centerLineStrokeStartAnim.duration  = 0.406 * totalDuration
		centerLineStrokeStartAnim.beginTime = 0.594 * totalDuration
		centerLineStrokeStartAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var centerLineAllAnim : CAAnimationGroup = QCMethod.groupAnimations([centerLineStrokeEndAnim, centerLineStrokeStartAnim], fillMode:fillMode)
		if (reverseAnimation){ centerLineAllAnim = QCMethod.reverseAnimation(centerLineAllAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		layers["centerLine"]?.add(centerLineAllAnim, forKey:"centerLineAllAnim")
		
		let upLine = layers["upLine"] as! CAShapeLayer
		
		////UpLine animation
		let upLineTransformAnim            = CABasicAnimation(keyPath:"transform.rotation")
		upLineTransformAnim.fromValue      = -45 * CGFloat(M_PI/180);
		upLineTransformAnim.toValue        = 0;
		upLineTransformAnim.duration       = 1 * totalDuration
		upLineTransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
		
		var upLineAllAnim : CAAnimationGroup = QCMethod.groupAnimations([upLineTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ upLineAllAnim = QCMethod.reverseAnimation(upLineAllAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		upLine.add(upLineAllAnim, forKey:"upLineAllAnim")
		
		let downLine = layers["downLine"] as! CAShapeLayer
		
		////DownLine animation
		let downLineTransformAnim       = CABasicAnimation(keyPath:"transform.rotation")
		downLineTransformAnim.fromValue = 45 * CGFloat(M_PI/180);
		downLineTransformAnim.toValue   = 0;
		downLineTransformAnim.duration  = totalDuration
		
		var downLineAllAnim : CAAnimationGroup = QCMethod.groupAnimations([downLineTransformAnim], fillMode:fillMode)
		if (reverseAnimation){ downLineAllAnim = QCMethod.reverseAnimation(downLineAllAnim, totalDuration:totalDuration) as! CAAnimationGroup}
		downLine.add(downLineAllAnim, forKey:"downLineAllAnim")
	}
	
	//MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValuesForAnimationId(anim.value(forKey: "animId") as! String)
                removeAnimationsForAnimationId(anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
//	override func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
//		if let completionBlock = completionBlocks[anim]{
//			completionBlocks.removeValue(forKey: anim)
//			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
//				updateLayerValuesForAnimationId(anim.value(forKey: "animId") as! String)
//				removeAnimationsForAnimationId(anim.value(forKey: "animId") as! String)
//			}
//			completionBlock(flag)
//		}
//	}
	
	func updateLayerValuesForAnimationId(_ identifier: String){
		if identifier == "all"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval"] as! CALayer).animation(forKey: "ovalAllAnim"), theLayer:(layers["oval"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["centerLine"] as! CALayer).animation(forKey: "centerLineAllAnim"), theLayer:(layers["centerLine"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["upLine"] as! CALayer).animation(forKey: "upLineAllAnim"), theLayer:(layers["upLine"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["downLine"] as! CALayer).animation(forKey: "downLineAllAnim"), theLayer:(layers["downLine"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(_ identifier: String){
		if identifier == "all"{
			(layers["oval"] as! CALayer).removeAnimation(forKey: "ovalAllAnim")
			(layers["centerLine"] as! CALayer).removeAnimation(forKey: "centerLineAllAnim")
			(layers["upLine"] as! CALayer).removeAnimation(forKey: "upLineAllAnim")
			(layers["downLine"] as! CALayer).removeAnimation(forKey: "downLineAllAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func ovalPathWithBounds(_ bound: CGRect) -> UIBezierPath{
		let ovalPath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		ovalPath.move(to: CGPoint(x: minX + 0.5 * w, y: minY))
		ovalPath.addCurve(to: CGPoint(x: minX, y: minY + 0.5 * h), controlPoint1:CGPoint(x: minX + 0.22386 * w, y: minY), controlPoint2:CGPoint(x: minX, y: minY + 0.22386 * h))
		ovalPath.addCurve(to: CGPoint(x: minX + 0.5 * w, y: minY + h), controlPoint1:CGPoint(x: minX, y: minY + 0.77614 * h), controlPoint2:CGPoint(x: minX + 0.22386 * w, y: minY + h))
		ovalPath.addCurve(to: CGPoint(x: minX + w, y: minY + 0.5 * h), controlPoint1:CGPoint(x: minX + 0.77614 * w, y: minY + h), controlPoint2:CGPoint(x: minX + w, y: minY + 0.77614 * h))
		ovalPath.addCurve(to: CGPoint(x: minX + 0.5 * w, y: minY), controlPoint1:CGPoint(x: minX + w, y: minY + 0.22386 * h), controlPoint2:CGPoint(x: minX + 0.77614 * w, y: minY))
		
		return ovalPath
	}
	
	func centerLinePathWithBounds(_ bound: CGRect) -> UIBezierPath{
		let centerLinePath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		centerLinePath.move(to: CGPoint(x: minX + 0.38885 * w, y: minY))
		centerLinePath.addCurve(to: CGPoint(x: minX + 0.99964 * w, y: minY + 0.8859 * h), controlPoint1:CGPoint(x: minX + 0.72158 * w, y: minY), controlPoint2:CGPoint(x: minX + 0.99486 * w, y: minY + 0.81999 * h))
		centerLinePath.addCurve(to: CGPoint(x: minX + 0.94891 * w, y: minY + h), controlPoint1:CGPoint(x: minX + 1.00443 * w, y: minY + 0.95182 * h), controlPoint2:CGPoint(x: minX + 0.95951 * w, y: minY + h))
		centerLinePath.addCurve(to: CGPoint(x: minX, y: minY + h), controlPoint1:CGPoint(x: minX + 0.73283 * w, y: minY + h), controlPoint2:CGPoint(x: minX + 0.21608 * w, y: minY + h))
		centerLinePath.move(to: CGPoint(x: minX + 0.38885 * w, y: minY))
		
		return centerLinePath
	}
	
	func upLinePathWithBounds(_ bound: CGRect) -> UIBezierPath{
		let upLinePath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		upLinePath.move(to: CGPoint(x: minX, y: minY + 0 * h))
		upLinePath.addLine(to: CGPoint(x: minX + w, y: minY + 0 * h))
		
		return upLinePath
	}
	
	func downLinePathWithBounds(_ bound: CGRect) -> UIBezierPath{
		let downLinePath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		downLinePath.move(to: CGPoint(x: minX, y: minY + 0 * h))
		downLinePath.addLine(to: CGPoint(x: minX + w, y: minY + 0 * h))
		
		return downLinePath
	}
	
	
}

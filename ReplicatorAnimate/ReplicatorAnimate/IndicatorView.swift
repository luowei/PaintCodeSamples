//
//  IndicatorView.swift
//
//  Code generated using QuartzCode 1.39.16 on 2016/10/24.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class IndicatorView: UIView {
	
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
		let replicator = CAReplicatorLayer()
		self.layer.addSublayer(replicator)
		layers["replicator"] = replicator
		let oval = CAShapeLayer()
		replicator.addSublayer(oval)
		layers["oval"] = oval
		
		resetLayerPropertiesForLayerIdentifiers(nil)
		setupLayerFrames()
	}
	
	func resetLayerPropertiesForLayerIdentifiers(_ layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("replicator"){
			let replicator = layers["replicator"] as! CAReplicatorLayer
			replicator.instanceCount     = 12
			replicator.instanceDelay     = 0.1
			replicator.instanceColor     = UIColor.white.cgColor
			replicator.instanceTransform = CATransform3DMakeRotation(30 * CGFloat(M_PI/180), 0, 0, -1)
		}
		if layerIds == nil || layerIds.contains("oval"){
			let oval = layers["oval"] as! CAShapeLayer
			oval.fillColor = UIColor(red:0.274, green: 0.308, blue:0.692, alpha:1).cgColor
			oval.lineWidth = 0
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let replicator : CAReplicatorLayer = layers["replicator"] as? CAReplicatorLayer{
			replicator.frame = CGRect(x: 0.1 * replicator.superlayer!.bounds.width, y: 0.1 * replicator.superlayer!.bounds.height, width: 0.8 * replicator.superlayer!.bounds.width, height: 0.8 * replicator.superlayer!.bounds.height)
		}
		
		if let oval : CAShapeLayer = layers["oval"] as? CAShapeLayer{
			oval.frame = CGRect(x: 0.41875 * oval.superlayer!.bounds.width, y: 0, width: 0.1625 * oval.superlayer!.bounds.width, height: 0.1625 * oval.superlayer!.bounds.height)
			oval.path  = ovalPathWithBounds((layers["oval"] as! CAShapeLayer).bounds).cgPath
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addReplicatorAnimation(){
		resetLayerPropertiesForLayerIdentifiers(["oval"])
		
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		let oval = layers["oval"] as! CAShapeLayer
		
		////Oval animation
		let ovalTransformAnim       = CABasicAnimation(keyPath:"transform")
		ovalTransformAnim.fromValue = NSValue(caTransform3D: CATransform3DIdentity);
		ovalTransformAnim.toValue   = NSValue(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 1));
		ovalTransformAnim.duration  = 1.2
		
		let ovalOpacityAnim       = CABasicAnimation(keyPath:"opacity")
		ovalOpacityAnim.fromValue = 1;
		ovalOpacityAnim.toValue   = 0;
		ovalOpacityAnim.duration  = 1.18
		
		let ovalReplicatorAnim : CAAnimationGroup = QCMethod.groupAnimations([ovalTransformAnim, ovalOpacityAnim], fillMode:fillMode)
		ovalReplicatorAnim.repeatCount = Float.infinity
		oval.add(ovalReplicatorAnim, forKey:"ovalReplicatorAnim")
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
	
	func updateLayerValuesForAnimationId(_ identifier: String){
		if identifier == "Replicator"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["oval"] as! CALayer).animation(forKey: "ovalReplicatorAnim"), theLayer:(layers["oval"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(_ identifier: String){
		if identifier == "Replicator"{
			(layers["oval"] as! CALayer).removeAnimation(forKey: "ovalReplicatorAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func ovalPathWithBounds(_ bound: CGRect) -> UIBezierPath{
		let ovalPath = UIBezierPath(ovalIn:bound)
		return ovalPath
	}
	
	
}

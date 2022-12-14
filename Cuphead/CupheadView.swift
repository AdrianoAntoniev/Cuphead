//
//  CupheadView.swift
//  Cuphead
//
//  Created by Adriano Rodrigues Vieira on 03/12/22.
//  Replied of https://almostengineer.medium.com/uibezierpath-lesson-how-to-draw-cuphead-on-layers-d164fd23cf61

import UIKit

// MARK: - Class

class CupheadView: UIView {

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupPaths()
    }

    required init?(coder: NSCoder) {
        fatalError("Ouch! No Storyboard, dude.")
    }

    private func setupViews() {
        backgroundColor = .white
    }

    private func setupPaths() {
        let head = getHeadShape()
        let ear = getEarShape()
        let rightEye = getRightEyeShape()
        let leftEye = getLeftEyeShape()
        let nose = getNoseShape()
        let mouth = getMouthShape()
        let tongue = getTongueShape()
        let drinkingTube = getDrinkingTubeShape()

        layer.addSublayer(head)
        layer.addSublayer(leftEye)
        layer.addSublayer(rightEye)
        layer.addSublayer(ear)
        layer.addSublayer(nose)
        layer.addSublayer(mouth)
        layer.addSublayer(drinkingTube)
        mouth.addSublayer(tongue)
    }
}

// MARK: - Extension Methods

private extension CupheadView {
    func getHeadShape() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 84, y: 196))
        path.addQuadCurve(to: CGPoint(x: 366, y: 100), controlPoint: CGPoint(x: 205, y: 100))
        path.addCurve(to: CGPoint(x: 84, y: 196),
                      controlPoint1: CGPoint(x: 500, y: 330),
                      controlPoint2: CGPoint(x: 120, y: 430))
        path.close()
        let headShape = CAShapeLayer()
        headShape.path = path.cgPath
        headShape.lineWidth = 5
        headShape.strokeColor = .black
        headShape.fillColor =  .clear
        return headShape
    }

    func getRightEyeShape() -> CAShapeLayer {
        let rightEyeWrapPath = UIBezierPath()
        rightEyeWrapPath.move(to: CGPoint(x: 392, y: 165))
        rightEyeWrapPath.addCurve(to: CGPoint(x: 317, y: 175),
                                  controlPoint1: CGPoint(x: 400, y: 200),
                                  controlPoint2: CGPoint(x: 330, y: 230))
        let eyePath = UIBezierPath()
        eyePath.move(to: CGPoint(x: 345, y: 135))
        eyePath.addQuadCurve(to: CGPoint(x: 350, y: 155),
                             controlPoint: CGPoint(x: 320, y: 150))
        eyePath.addCurve(to: CGPoint(x: 315, y: 150),
                         controlPoint1: CGPoint(x: 355, y: 190),
                         controlPoint2: CGPoint(x: 315, y: 195))
        eyePath.addCurve(to: CGPoint(x: 345, y: 135),
                         controlPoint1: CGPoint(x: 300, y: 100),
                         controlPoint2: CGPoint(x: 340, y: 100))
        let rightEyeWrapShape = CAShapeLayer()
        rightEyeWrapShape.path = rightEyeWrapPath.cgPath
        rightEyeWrapShape.lineWidth = 5
        rightEyeWrapShape.strokeColor = .black
        rightEyeWrapShape.fillColor =  .clear
        let eyeShape = CAShapeLayer()
        eyeShape.path = eyePath.cgPath
        eyeShape.strokeColor = .black
        eyeShape.lineWidth = 1
        eyeShape.fillColor = .black
        rightEyeWrapShape.addSublayer(eyeShape)
        return rightEyeWrapShape
    }

    func getLeftEyeShape() -> CAShapeLayer {
        let leftEyeWrapPath = UIBezierPath()
        leftEyeWrapPath.move(to: CGPoint(x: 135, y: 162))
        leftEyeWrapPath.addCurve(to: CGPoint(x: 300, y: 105),
                                  controlPoint1: CGPoint(x: 140, y: 280),
                                  controlPoint2: CGPoint(x: 380, y: 280))
        let eyePath = UIBezierPath()
        eyePath.move(to: CGPoint(x: 233, y: 155))
        eyePath.addQuadCurve(to: CGPoint(x: 242, y: 185),
                             controlPoint: CGPoint(x: 200, y: 180))
        eyePath.addCurve(to: CGPoint(x: 190, y: 180),
                         controlPoint1: CGPoint(x: 250, y: 240),
                         controlPoint2: CGPoint(x: 215, y: 235))
        eyePath.addCurve(to: CGPoint(x: 233, y: 155),
                         controlPoint1: CGPoint(x: 170, y: 120),
                         controlPoint2: CGPoint(x: 230, y: 130))
        let leftEyeWrapShape = CAShapeLayer()
        leftEyeWrapShape.path = leftEyeWrapPath.cgPath
        leftEyeWrapShape.lineWidth = 5
        leftEyeWrapShape.strokeColor = .black
        leftEyeWrapShape.fillColor =  .clear
        let eyeShape = CAShapeLayer()
        eyeShape.path = eyePath.cgPath
        eyeShape.lineWidth = 1
        eyeShape.strokeColor = .black
        eyeShape.fillColor = .blackWithAlphaOne
        leftEyeWrapShape.addSublayer(eyeShape)
        return leftEyeWrapShape
    }

    func getNoseShape() -> CAShapeLayer {
        let nosePath = UIBezierPath(ovalIn: CGRect(x: 310, y: 180, width: 52, height: 30))
        let noseShape = CAShapeLayer()
        noseShape.path = nosePath.cgPath
        noseShape.strokeColor = .black
        noseShape.lineWidth = 4
        noseShape.fillColor = .orange
        return noseShape
    }

    func getEarShape() -> CAShapeLayer {
        let path = UIBezierPath(arcCenter: CGPoint(x: 100, y: 260),
                                radius: 55.0,
                                startAngle: 1.4 * CGFloat.pi,
                                endAngle: CGFloat.pi / 4,
                                clockwise: false)
        let path2 = UIBezierPath(arcCenter: CGPoint(x: 100, y: 260),
                                radius: 20.0,
                                startAngle: 1.4 * CGFloat.pi,
                                endAngle: CGFloat.pi / 4,
                                clockwise: false)
        let earShape = CAShapeLayer()
        earShape.path = path.cgPath
        earShape.lineWidth = 5
        earShape.strokeColor = .black
        earShape.fillColor =  .clear
        let fullEar = CAShapeLayer()
        fullEar.addSublayer(earShape)
        let innerEar = CAShapeLayer()
        innerEar.path = path2.cgPath
        innerEar.lineWidth = 5
        innerEar.strokeColor = .black
        innerEar.fillColor =  .clear
        fullEar.addSublayer(innerEar)
        return fullEar
    }

    func getMouthShape() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 310, y: 250))
        path.addCurve(to: CGPoint(x: 175, y: 250),
                      controlPoint1: CGPoint(x: 330, y: 335),
                      controlPoint2: CGPoint(x: 125, y: 325))
        path.addCurve(to: CGPoint(x: 310, y: 250),
                      controlPoint1: CGPoint(x: 195, y: 245),
                      controlPoint2: CGPoint(x: 260, y: 265))
        let mouthShape = CAShapeLayer()
        mouthShape.path = path.cgPath
        mouthShape.lineWidth = 3
        mouthShape.strokeColor = .black
        mouthShape.fillColor =  .black
        return mouthShape
    }

    func getTongueShape() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 290))
        path.addCurve(to: CGPoint(x: 230, y: 285),
                      controlPoint1: CGPoint(x: 160, y: 250),
                      controlPoint2: CGPoint(x: 210, y: 250))
        path.addCurve(to: CGPoint(x: 270, y: 305),
                      controlPoint1: CGPoint(x: 210, y: 260),
                      controlPoint2: CGPoint(x: 260, y: 265))
        path.addQuadCurve(to: CGPoint(x: 175, y: 290),
                          controlPoint: CGPoint(x: 210, y: 320))
        let tongueShape = CAShapeLayer()
        tongueShape.path = path.cgPath
        tongueShape.lineWidth = 2
        tongueShape.strokeColor = .black
        tongueShape.fillColor = .orange
        return tongueShape
    }

    func getDrinkingTubeShape() -> CAShapeLayer {
        //Wraper Shape
        let wrapPath = UIBezierPath()
        wrapPath.move(to: CGPoint(x: 170, y: 145))
        wrapPath.addLine(to: CGPoint(x: 125, y: 70))
        wrapPath.addLine(to: CGPoint(x: 5, y: 110))
        wrapPath.addQuadCurve(to: CGPoint(x: 35, y: 175),
                          controlPoint: CGPoint(x: -5, y: 160))
        wrapPath.addQuadCurve(to: CGPoint(x: 95, y: 150),
                          controlPoint: CGPoint(x: 60, y: 165))
        wrapPath.addLine(to: CGPoint(x: 110, y: 175))
        let tubeWrapShape = CAShapeLayer()
        tubeWrapShape.path = wrapPath.cgPath
        tubeWrapShape.lineWidth = 5
        tubeWrapShape.strokeColor = .black
        tubeWrapShape.fillColor = .clear

        //Red Line 1
        let redLinePath1 = UIBezierPath()
        redLinePath1.move(to: CGPoint(x: 160, y: 130))
        redLinePath1.addQuadCurve(to: CGPoint(x: 105, y: 170),
                          controlPoint: CGPoint(x: 120, y: 130))
        redLinePath1.addCurve(to: CGPoint(x: 145, y: 105),
                              controlPoint1: CGPoint(x: 90, y: 140),
                              controlPoint2: CGPoint(x: 80, y: 120))
        redLinePath1.close()
        let redLineShape1 = CAShapeLayer()
        redLineShape1.path = redLinePath1.cgPath
        redLineShape1.lineWidth = 3
        redLineShape1.strokeColor = .black
        redLineShape1.fillColor = .orange
        tubeWrapShape.addSublayer(redLineShape1)

        //Red Line 2
        let redLinePath2 = UIBezierPath()
        redLinePath2.move(to: CGPoint(x: 70, y: 160))
        redLinePath2.addLine(to: CGPoint(x: 70, y: 90))
        redLinePath2.addLine(to: CGPoint(x: 40, y: 100))
        redLinePath2.addLine(to: CGPoint(x: 40, y: 170))
        redLinePath2.close()
        let redLineShape2 = CAShapeLayer()
        redLineShape2.path = redLinePath2.cgPath
        redLineShape2.lineWidth = 3
        redLineShape2.strokeColor = .black
        redLineShape2.fillColor = .orange
        tubeWrapShape.addSublayer(redLineShape2)

        //Middle Line Shape
        let middleLinePath = UIBezierPath()
        middleLinePath.move(to: CGPoint(x: 97, y: 155))
        middleLinePath.addQuadCurve(to: CGPoint(x: 125, y: 70),
                                    controlPoint: CGPoint(x: 80, y: 80))
        let middleLineShape = CAShapeLayer()
        middleLineShape.path = middleLinePath.cgPath
        middleLineShape.lineWidth = 3
        middleLineShape.strokeColor = .black
        middleLineShape.fillColor = .clear
        tubeWrapShape.addSublayer(middleLineShape)
        return tubeWrapShape
    }
}

//
//  ImagedDualLabelCell.swift
//  NearbyWeather
//
//  Created by Erik Maximilian Martens on 13.04.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import UIKit

class ImagedDualLabelCell: UITableViewCell, ReuseIdentifiable {
  
  private lazy var contentLabel = Factory.Label.make(fromType: .body())
  private lazy var descriptionLabel = Factory.Label.make(fromType: .description(alignment: .right, numberOfLines: 1))
  private lazy var leadingImageView = Factory.ImageView.make(fromType: .cellPrefix)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    composeCell()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ImagedDualLabelCell {
  
  func configure(
    withTitle title: String,
    description: String?,
    image: UIImage?,
    imageBackgroundColor: UIColor
  ) {
    contentLabel.text = title
    descriptionLabel.text = description
    leadingImageView.image = image
    leadingImageView.backgroundColor = imageBackgroundColor
  }
}

private extension ImagedDualLabelCell {
  
  func composeCell() {
    separatorInset = UIEdgeInsets(
      top: 0,
      left: Constants.Spacing.TableCellContentInsets.leading
        + Constants.Dimensions.TableCellImageSize.width
        + Constants.Spacing.InterElementSpacing.xDistance(from: .small),
      bottom: 0,
      right: 0
    )
    
    contentView.addSubview(leadingImageView, constraints: [
      leadingImageView.heightAnchor.constraint(equalToConstant: Constants.Dimensions.TableCellImageSize.height),
      leadingImageView.widthAnchor.constraint(equalToConstant: Constants.Dimensions.TableCellImageSize.width),
      leadingImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: Constants.Spacing.TableCellContentInsets.top),
      leadingImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -Constants.Spacing.TableCellContentInsets.bottom),
      leadingImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Spacing.TableCellContentInsets.leading),
      leadingImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    contentView.addSubview(contentLabel, constraints: [
      contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.Dimensions.ContentElementSize.height),
      contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spacing.TableCellContentInsets.top),
      contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spacing.TableCellContentInsets.bottom),
      contentLabel.leadingAnchor.constraint(equalTo: leadingImageView.trailingAnchor, constant: Constants.Spacing.InterElementSpacing.xDistance(from: .small)),
      contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
    
    contentView.addSubview(descriptionLabel, constraints: [
      descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.Dimensions.ContentElementSize.height),
      descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Spacing.TableCellContentInsets.top),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Spacing.TableCellContentInsets.bottom),
      descriptionLabel.leadingAnchor.constraint(equalTo: contentLabel.trailingAnchor, constant: Constants.Spacing.InterElementSpacing.xDistance(from: .small)),
      descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Spacing.TableCellContentInsets.trailing),
      descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      descriptionLabel.heightAnchor.constraint(equalTo: contentLabel.heightAnchor, multiplier: 1),
      descriptionLabel.widthAnchor.constraint(equalTo: contentLabel.widthAnchor, multiplier: 1/2)
    ])
  }
}

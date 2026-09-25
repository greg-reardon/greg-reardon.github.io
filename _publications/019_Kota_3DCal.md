---
title: "3D Cal: An Open-Source Software Library for Depth Reconstruction on Vision-Based Tactile Sensors"
authors: 'Rohan Kota, Kaival Shah, J. Edward Colgate, Gregory Reardon'
shortAuthors: Kota, Shah, Colgate, Reardon
venue: 'IEEE Robotics and Automation Letters (RA-L)'
year: 2026
paperurl: 'https://ieeexplore.ieee.org/abstract/document/11433757'
coverImage: '../images/user/Kota_3DCal.png'
collection: publications
permalink: /publication/019_Kota_3DCal
bestPaper: 0
otherAward: 0
show: true
downloadLink: ''
websiteUrl: 'https://rohankotanu.github.io/3DCal/'
websiteLabel: 'Check out the project website to get started!'
---


Tactile sensing plays a key role in enabling dexterous and reliable robotic manipulation, but realizing this capability requires substantial calibration to convert raw sensor readings into physically meaningful quantities. Despite its near-universal necessity, the calibration process remains ad hoc and labor-intensive. Here, we introduce 3D Cal, an open-source library that transforms a low-cost 3D printer into an automated probing device capable of generating large volumes of labeled training data for calibrating vision-based tactile sensors. 3D Cal also provides an end-to-end, user-friendly pipeline for training custom convolutional networks to produce high-quality depth reconstructions. Using 3D Cal, we systematically explore the relationship between training data volume and spatial reconstruction performance on two commercially available sensors, DIGIT and GelSight Mini, and derive practical, empirically-grounded guidelines for calibrating these sensors. Finally, we demonstrate depth reconstruction performance on the DIGIT and GelSight Mini comparable to state-of-the-art methods, achieving average reconstruction errors of 156 μm and 205 μm on unseen objects, respectively. By automating tactile sensor calibration, 3D Cal can accelerate tactile sensing research, simplify sensor deployment, and facilitate the integration of tactile sensing in robotic platforms.
---
title: "Dead Zone Bilateral Control for High Performance Robotic Teleoperation"
authors: 'Rohan Kota, Patrick Dills, Gregory Reardon, Matthew L. Elwin, and J. Edward Colgate'
shortAuthors: Kota, Dills, Reardon, Elwin, Colgate
venue: 'IEEE Robotics and Automation Letters (RA-L)'
year: 2026
paperurl: 'https://ieeexplore.ieee.org/abstract/document/11447396'
coverImage: '../images/user/Kota_DZBC.png'
collection: publications
permalink: /publication/020_Kota_Deadzone
bestPaper: 0
otherAward: 0
show: false
downloadLink: ''
---


Autonomous robot policies are commonly trained using demonstration data acquired via robotic teleoperation, a process which can be time-intensive and physically demanding for human operators. Bilateral control can speed up robotic teleoperation by allowing the operator to feel the forces experienced by the remote manipulator, but it can also transmit undesirable forces, such as friction and damping, back to the operator. Here, we present dead zone bilateral control, an improvement to the conventional position-position bilateral control scheme that prevents the transmission of unwanted forces during free-space motion. We implement our controller on a custom 2-degree-of-freedom teleoperation device and show that it reduces the energy required for free-space motion by approximately 50%. During a user study in which 16 participants performed a peg rolling task, our controller reduced completion times by an average of 25% compared to the standard position-position bilateral controller. The results suggest that dead zone bilateral control can expedite the collection of teleoperated task demonstrations, allowing researchers to gather larger datasets for training autonomous robot policies.
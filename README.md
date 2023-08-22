# Empowering Early Breast Cancer Intervention with AI Imaging
Team members: Muwonge Lawrence, Sibongiseni Msipa, Mawunyo Avornyo, Emmanuel Osei-Frempong, Naa Adjeley Frempong, Fatma Omar
# Abstract 
Breast cancer poses a global challenge, with increasing cases and limitations in current detection methods. To address this, our project leverages the power of AI imaging for early intervention. We aim to develop an AI-driven system that enhances breast cancer detection, assists radiologists, and tailors personalized treatment plans. By utilizing advanced techniques like deep learning and convolutional neural networks (CNNs), we seek to improve accuracy, reduce false positives, and empower data-driven decision-making. Our vision is a future where technology and medical expertise converge to reshape breast cancer screening and care.

Keywords: Breast cancer detection, AI imaging, medical imaging, early intervention, mammography
# Methods 
**Data Collection**

The data will be collected from CBIS-DDSM (Curated Breast Imaging Subset of DDSM). The DDSM is a database of 2,620 scanned film mammography studies. It contains normal, benign, and malignant cases with verified pathology information. The scale of the database along with ground truth validation makes the DDSM a useful tool in the development and testing of decision support systems.

The proposed method for empowering early breast cancer intervention with AI imaging is a two-step process:

**Classification:** The first step is to classify an input image as either benign or malignant. This can be done using a convolutional neural network (CNN).

**Semantic segmentation:** The second step is to perform semantic segmentation on the input image to identify the location of any masses or calcifications. This can also be done using a CNN.
The CNN for classification will be trained on a dataset of breast cancer images that have been labeled as either benign or malignant. The CNN for semantic segmentation will be trained on a dataset of breast cancer images that have been annotated with the location of any masses or calcifications.

The performance of the proposed method will be evaluated on a held-out dataset of breast cancer images. The evaluation metrics will include accuracy, sensitivity, and specificity.

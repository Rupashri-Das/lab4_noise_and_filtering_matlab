# Lab 4 — Noise and Filtering (MATLAB)

This lab focuses on modelling common noise types in images and comparing the performance of different filters in terms of visual quality and mean-square error (MSE). The experiment was done using the built-in `peppers.png` image in MATLAB.

---

## 1. Noise Modelling

Two types of noise were added to the original image:
- Gaussian noise
- Salt & pepper noise

The effect of each noise type was compared visually and by calculating MSE.

---

## 2. Filtering Methods

The following filters were applied to both noisy images:
- Mean (average) linear filter
- Gaussian linear filter
- Median non-linear filter

Results were compared both by visual output and by MSE values printed in the MATLAB Command Window.

---

## 3. Observations

- Median filtering is more effective for salt and pepper noise because it removes isolated pixel spikes without blurring edges.
- Gaussian noise is better reduced by linear filters such as the mean or Gaussian filter, although they smooth the image and reduce edge sharpness.
- Linear filters blur edges because they average neighbouring values, while median filtering preserves details better.
- Adaptive filtering could further improve results by adjusting behaviour depending on local image characteristics.

---

## 4. How to Run

1. Open MATLAB (Online or Desktop).
2. Run the provided script.
3. Save the output figures.
4. Add them to the repository along with this README.

---

## 5. Environment

- MATLAB Online (R2024x or similar)
- Uses built-in `peppers.png`

---

## 6. Author

Name: Rupashri Das 
Date: 1.11.2025

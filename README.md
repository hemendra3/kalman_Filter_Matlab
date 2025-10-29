# Generic Kalman Filter Implementation in MATLAB

This repository provides a simple MATLAB implementation of a one-dimensional Kalman Filter. The script is designed for easy adaptation to any type of sequential, noisy measurement data (not just RSSI or beacon signals). It also demonstrates how to visualize the results using moving window statistics and other plots.

## Files

- `kalman_filter.m` — Main MATLAB script for filtering and plotting.
- **Your data file** (e.g., `help_beacon_1000.csv`) — Input CSV data file containing your noisy measurements (must be present in the same directory).

## Prerequisites

- MATLAB (R2018b or later recommended)
- Statistics and Machine Learning Toolbox (for `movmean`, `movmin`, `movmax`)
- Input data file: A CSV file with at least one column of measurement data.

## How to Use

1. **Prepare Your Data File**
   - Place your sequential measurement data in a CSV file.
   - By default, the script reads the second column (`Var2`) of the file. Change the column reference in the script as needed for your data.

2. **Place the Script and Data File**
   - Make sure `kalman_filter.m` and your data file (e.g., `your_data.csv`) are in the same directory.

3. **Edit the Script for Your Data (Optional)**
   - If your data column is not named `Var2`, update this line in the script:
     ```matlab
     yk = data.Var2;  % Change Var2 to match your column name or index
     ```

4. **Run the Script in MATLAB**
   - Set the current folder to the script's directory.
   - Run:
     ```matlab
     kalman_filter
     ```

5. **Results**
   - The script will read your data, apply the Kalman filter, and display six plots:
     1. Actual (raw) measurements
     2. Moving mean (window size 10)
     3. Moving max/min (window size 10)
     4. Histogram of measurements
     5. Kalman filter estimated values
     6. Evolution of estimation error variance

## Adjustable Parameters

- `sigma`: Standard deviation of measurement noise (default: `2`).
- Initial estimate of the state (`xhat`) and its variance (`Phat`).
- Moving window size (default: `10`, can be changed in the script).

These parameters can be adjusted at the top of the script to better fit your data and noise characteristics.

## Notes

- The script is generic—works for **any sequential measurement data** (temperature, stock prices, sensor data, etc.).
- For vector/multi-dimensional data, further modification is needed (this script is for scalar sequences).
- Ensure your data file is properly formatted and referenced in the script.

## Example

If you run the script with your own CSV, you will see six subplots visualizing the raw, smoothed, and Kalman-filtered results.

## Author

hemendra3

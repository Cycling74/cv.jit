# cv.jit change log

## Version 1.8

* Support for 64-bit architectures
* Distributed as a Max package

## Version 1.7

cv.jit.blobs.moments: Fixed a problem where the order of the Hu invariants did not match that of those outputted by cv.jit.moments.

cv.jit.centroids: Outputs coordinates of (-1,-1) when the image is empty instead of NaN.


## Version 1.6
2008-02-27

CHANGES TO OLD OBJECTS

All externals are now compiled as universal binaries under Mac OS. This means that there is no need to use separate versions for PPC and Intel machines.

	cv.jit.centroids: rewritten so that it can be used in js. Also, the external now supports any data type.
	cv.jit.dilate/ cv.jit.erode: Under Mac OS, these externals now use Core Image functionality which can in the best of cases improve performance by an order of magnitude. 
	cv.jit.faces: Added an attribute called “nfaces” that returns the number of detected faces. This can be useful for detecting when there are no faces in the image, as the external returns a dummy matrix in this case.
	cv.jit.features: Added a new attribute called “precision”, which when set to 1 tells the external to calculate features with sub-pixel accuracy.
	cv.jit.track: The maximum number of points that can be tracked at once used to be set to 255 but can now be arbitrarily large. Note however that very large number of tracking points will result in very slow performance.
	cv.jit.label: Fixed a bug that caused "mode 1" operation to not label correctly when "charmode" was set to 1.

NEW EXTERNALS
	cv.jit.resize: This external uses bi-cubic interpolation to resize an imcomming matrix. This yields a higher-quality image than using jit.matrix with a lower resolution.
	cv.jit.shift: Implements the MeanShift and CAMShift algorithms for tracking greyscale and binary blobs.
	cv.jit.shift.draw: Drawing utility for cv.jit.shift.

## Version 1.5
2006-10-03


CHANGES TO OLD OBJECTS

	cv.jit.moments: output now accessible from js.
	cv.jit.mean: now accurately computes mean even for char data, no need to convert to float before processing.
	cv.jit.track: output now only has 1-dimension, instead of having a dummy second dimension of 1.
	cv.jit.orientation: changed algorithm, now correctly outputs only values between 0. and pi..
	cv.jit.elongation: changed algorithm, gives better results.
	cv.jit.open, cv.jit.close: now properly filter out "done" message from patcherargs.

	The pdf manual is no longer updated, but every external and abstraction now has its own help file.


NEW EXTERNALS

	cv.jit.blobs.* : this series of externals performs a number of analysis function on individual blobs (connected components) labeld by cv.jit.label.

	cv.jit.blobs.bounds: finds bounding box for each blob.
	cv.jit.blobs.centroids: finds centroids and mass for each blob.
	cv.jit.blobs.direction: estimates the direction each blob points to.
	cv.jit.blobs.elongation: measures each blob's elongation (thinness).
	cv.jit.blobs.moments: calculate moments of inertia, Hu invariants, centroids and mass for each blob.
	cv.jit.blobs.orientation: finds the main axis for each blob.
	cv.jit.blobs.recon: estimates the statistical distance between each blob and a trained model.
	cv.jit.blobs.sort: assigns blobs labels that do not easily change from frame to frame.

	cv.jit.canny: extract edges.
	cv.jit.faces: finds human faces. (Not available for pre-Jitter 1.6 version on Mac.)
	cv.jit.features: finds high-contrast, easy-to-track areas.
	cv.jit.hough: computes Hough space from edges.
	cv.jit.learn: perform pattern recognition.
	cv.jit.lines: find straight lines.
	cv.jit.ravg: compute the running average over time. (Essentially duplicates jit.slide but gives more accurate output with char input.)


NEW ABSTRACTIONS

	The .draw series: several abstractions are provided for simply overlaying data on an input image.

	cv.jit.blobs.bounds.draw
	cv.jit.blobs.centroids.draw
	cv.jit.blobs.direction.draw
	cv.jit.blobs.elongation.draw
	cv.jit.blobs.orient.draw (For use with cv.jit.blobs.orientation.)
	cv.jit.centroids.draw
	cv.jit.faces.draw
	cv.jit.features.draw
	cv.jit.lines.draw
	cv.jit.track.draw (Replaces cv.jit.trackpoint.)
	
	cv.jit.blobs.color/cv.jit.blobs.colour: assign random colours to cv.jit.label's output (previously only a sub-patcher).
	cv.jit.direction: finds the direction the image leans/points to.
	cv.jit.features2track: initialize cv.jit.track to pixels for likely to "stick".
	cv.jit.hough2lines: extract lines from Hough space computed by cv.jit.hough.



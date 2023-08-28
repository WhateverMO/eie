#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <stdlib.h>
#include <stdio.h>

using namespace cv;

/// Global variables

Mat src, src_gray;
Mat dst, detected_edges;

int lowThreshold=100;
int highThreshold=200;
int const max_lowThreshold = 400;
int kernel_size = 3;
int const max_kernel_size=10;
char* window_name = "Edge Map";
///**
// * @function CannyThreshold
//  * @brief Trackbar callback - Canny thresholds input with a ratio 1:3
//   */
void CannyThreshold(int, void*)
{
	/// Reduce noise with a kernel 3x3
	blur( src_gray, detected_edges, Size(kernel_size,kernel_size) );

	/// Canny detector
	Canny( detected_edges, detected_edges, lowThreshold, highThreshold, 3 );
	/// Using Canny's output as a mask, we display our result
	dst = Scalar::all(0);

	src.copyTo( dst, detected_edges);
	imshow( window_name, dst );
}
void saveEdge(int,void*)
{
	imwrite("edge.png",dst);
}
/** @function main */
int main( int argc, char** argv )
{
	/// Load an image
	src = imread( argv[1] );

	if( !src.data )
	{ return -1; }

	/// Create a matrix of the same type and size as src (for dst)
	dst.create( src.size(), src.type() );

	/// Convert the image to grayscale
	cvtColor( src, src_gray, CV_BGR2GRAY );

	//                                      /// Create a window
	namedWindow( window_name, CV_WINDOW_AUTOSIZE );

	createButton("save edge",saveEdge);
	/// Create a Trackbar for user to enter threshold
	createTrackbar( "Min Threshold:", window_name, &lowThreshold, max_lowThreshold, CannyThreshold );

	createTrackbar( "Max Threshold:", window_name, &highThreshold, max_lowThreshold, CannyThreshold );
	createTrackbar("Kernel Size:",window_name,&kernel_size,max_kernel_size,CannyThreshold);
	/// Show the image
	CannyThreshold(0, 0);
	/// Wait until user exit program by pressing a key
	waitKey(0);
}

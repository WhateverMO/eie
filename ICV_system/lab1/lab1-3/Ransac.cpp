//
//  Created by zjj on 21/09/2023.
//

#include <iostream>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <boost/thread/thread.hpp>
#include <boost/random.hpp>
#include <string>
#include <pcl/visualization/pcl_visualizer.h>

using namespace std;

boost::random::mt19937 gen(time((time_t *)NULL)); //随机数生成器


void VisualizeCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, pcl::PointCloud<pcl::PointXYZ>::Ptr& filter_cloud) {
	//---------显示点云-----------------------
	boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer("显示点云"));

	int v1(0), v2(0);
	viewer->createViewPort(0.0, 0.0, 0.5, 1.0, v1);
	viewer->setBackgroundColor(0, 0, 0, v1);
	viewer->addText("point clouds", 10, 10, "v1_text", v1);
	viewer->createViewPort(0.5, 0.0, 1, 1.0, v2);
	viewer->setBackgroundColor(0.1, 0.1, 0.1, v2);
	viewer->addText("filtered point clouds", 10, 10, "v2_text", v2);
	pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZ> fildColor(cloud, "z"); // 按照z字段进行渲染,将z改为x或y即为按照x或y字段渲染
	viewer->addPointCloud<pcl::PointXYZ>(cloud, fildColor, "sample cloud", v1);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR, 0, 0, 1, "sample cloud", v1);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 5, "sample cloud", v1);

    // pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZ> fildColor_filtered(cloud, "z"); // 按照z字段进行渲染,将z改为x或y即为按照x或y字段渲染
	// viewer->addPointCloud<pcl::PointXYZ>(filter_cloud, fildColor_filtered,"cloud_filtered", v2);
	//viewer->addCoordinateSystem(1.0);
	//viewer->initCameraParameters();
    viewer->addPointCloud<pcl::PointXYZ>(filter_cloud, "cloud_filtered", v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR, 0, 1, 0, "cloud_filtered", v2);
    viewer->setPointCloudRenderingProperties(pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 5, "cloud_filtered", v2);
	while (!viewer->wasStopped())
	{
		viewer->spinOnce(100);
		boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	}
}

vector<int> RANCAC_sphere(const pcl::PointCloud<pcl::PointXYZ>& r_sample, int iter_maxNum, float maxD) {
    int RSample_poinsNum = r_sample.width,iterNum = 0;
    int inPlaneNum_max = 0;
    float x0_best = 0, y0_best = 0, z0_best = 0, r0_best = 0;
    vector<int> inliers_best;
    boost::uniform_int<> real(0, RSample_poinsNum - 1);
    while ((iterNum < iter_maxNum) && inPlaneNum_max <= RSample_poinsNum)
    {
        vector<int> inliers = { 0 };
        int inPlaneNum_t = 0;

        float x1 = 0,x2 = 0,x3 = 0, y1 = 0, y2 = 0, y3 = 0, z1 = 0, z2 = 0, z3 = 0, x4 = 0, y4 = 0, z4 = 0;
        while (1){
            int rand_i_1 = real(gen);
            int rand_i_2 = real(gen);
            int rand_i_3 = real(gen);
            int rand_i_4 = real(gen);
            if (rand_i_1 != rand_i_2) {
                x1 = r_sample.points[rand_i_1].x;
                y1 = r_sample.points[rand_i_1].y;
                z1 = r_sample.points[rand_i_1].z;
                x2 = r_sample.points[rand_i_2].x;
                y2 = r_sample.points[rand_i_2].y;
                z2 = r_sample.points[rand_i_2].z;
                x3 = r_sample.points[rand_i_3].x;
                y3 = r_sample.points[rand_i_3].y;
                z3 = r_sample.points[rand_i_3].z;
                x4 = r_sample.points[rand_i_4].x;
                y4 = r_sample.points[rand_i_4].y;
                z4 = r_sample.points[rand_i_4].z;
                break;
            }
        }

        double a11,a12,a13,a21,a22,a23,a31,a32,a33,b1,b2,b3,d,d1,d2,d3;
        a11=2*(x2-x1); a12=2*(y2-y1); a13=2*(z2-z1);
        a21=2*(x3-x2); a22=2*(y3-y2); a23=2*(z3-z2);
        a31=2*(x4-x3); a32=2*(y4-y3); a33=2*(z4-z3);
        b1=x2*x2-x1*x1+y2*y2-y1*y1+z2*z2-z1*z1;
        b2=x3*x3-x2*x2+y3*y3-y2*y2+z3*z3-z2*z2;
        b3=x4*x4-x3*x3+y4*y4-y3*y3+z4*z4-z3*z3;
        d=a11*a22*a33+a12*a23*a31+a13*a21*a32-a11*a23*a32-a12*a21*a33-a13*a22*a31;
        d1=b1*a22*a33+a12*a23*b3+a13*b2*a32-b1*a23*a32-a12*b2*a33-a13*a22*b3;
        d2=a11*b2*a33+b1*a23*a31+a13*a21*b3-a11*a23*b3-b1*a21*a33-a13*b2*a31;
        d3=a11*a22*b3+a12*b2*a31+b1*a21*a32-a11*b2*a32-a12*a21*b3-b1*a22*a31;
        double x0=d1/d;
        double y0=d2/d;
        double z0=d3/d;
        double r0=sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0)+(z1-z0)*(z1-z0));

        for (int i = 0; i < RSample_poinsNum; i++) {
            float distance = abs(sqrt((r_sample[i].x-x0)*(r_sample[i].x-x0)+(r_sample[i].y-y0)*(r_sample[i].y-y0)+(r_sample[i].z-z0)*(r_sample[i].z-z0))-r0);
            if (distance <= maxD) {
                inPlaneNum_t++;
                inliers.push_back(i);
            }
        }

        if (inPlaneNum_t > inPlaneNum_max) {
            inPlaneNum_max = inPlaneNum_t;
            x0_best = x0;
            y0_best = y0;
            z0_best = z0;
            r0_best = r0;
            inPlaneNum_max = inPlaneNum_t;
            inliers_best = inliers;
        }
        iterNum++;
    }

    return inliers_best;
    
}

vector<int> RANCAC_plane(const pcl::PointCloud<pcl::PointXYZ>& r_sample, int iter_maxNum, float maxD) {
    int RSample_poinsNum = r_sample.width,iterNum = 0;
    int inPlaneNum_max = 0;
    float A_best = 0, B_best = 0, C_best = 0, D_best = 0;
    vector<int> inliers_best;
    boost::uniform_int<> real(0, RSample_poinsNum - 1);
    while ((iterNum < iter_maxNum) && inPlaneNum_max <= RSample_poinsNum)
    {
        vector<int> inliers = { 0 };
        int inPlaneNum_t = 0;

        float x1 = 0,x2 = 0,x3 = 0, y1 = 0, y2 = 0, y3 = 0, z1 = 0, z2 = 0, z3 = 0;
        while (1){
            int rand_i_1 = real(gen);
            int rand_i_2 = real(gen);
            int rand_i_3 = real(gen);
            if (rand_i_1 != rand_i_2) {
                x1 = r_sample.points[rand_i_1].x;
                y1 = r_sample.points[rand_i_1].y;
                z1 = r_sample.points[rand_i_1].z;
                x2 = r_sample.points[rand_i_2].x;
                y2 = r_sample.points[rand_i_2].y;
                z2 = r_sample.points[rand_i_2].z;
                x3 = r_sample.points[rand_i_3].x;
                y3 = r_sample.points[rand_i_3].y;
                z3 = r_sample.points[rand_i_3].z;
                break;
            }
        }

        float A_t = (y2 - y1) * (z3 - z1) - (z2 - z1) * (y3 - y1);
        float B_t = (z2 - z1) * (x3 - x1) - (x2 - x1) * (z3 - z1);
        float C_t = (x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1);
        float D_t = -(A_t * x1 + B_t * y1 + C_t * z1);

        float temp = sqrt(A_t * A_t + B_t * B_t + C_t * C_t);

        for (int i = 0; i < RSample_poinsNum; i++) {
            float distance = abs(A_t * r_sample[i].x + B_t * r_sample[i].y + C_t * r_sample[i].z + D_t) / temp;
            if (distance <= maxD) {
                inPlaneNum_t++;
                inliers.push_back(i);
            }
        }

        if (inPlaneNum_t > inPlaneNum_max) {
            inPlaneNum_max = inPlaneNum_t;
            A_best = A_t;
            B_best = B_t;
            C_best = C_t;
            D_best = temp;
            inPlaneNum_max = inPlaneNum_t;
            inliers_best = inliers;
        }
        iterNum++;
    }

    return inliers_best;
    
}

vector<int> RANCAC_line(const pcl::PointCloud<pcl::PointXYZ>& r_sample, int iter_maxNum, float maxD) {
    int RSample_poinsNum = r_sample.width,iterNum = 0;
    int inPlaneNum_max = 0;
    float A_best = 0, B_best = 0, C_best = 0, D_best = 0;
    vector<int> inliers_best;
    boost::uniform_int<> real(0, RSample_poinsNum - 1);
    while ((iterNum < iter_maxNum) && inPlaneNum_max <= RSample_poinsNum)
    {
        vector<int> inliers = { 0 };
        int inPlaneNum_t = 0;

        float x1 = 0,x2 = 0, y1 = 0, y2 = 0;
        while (1){
            int rand_i_1 = real(gen);
            int rand_i_2 = real(gen);
            if (rand_i_1 != rand_i_2) {
                x1 = r_sample.points[rand_i_1].x;
                y1 = r_sample.points[rand_i_1].y;
                x2 = r_sample.points[rand_i_2].x;
                y2 = r_sample.points[rand_i_2].y;
                break;
            }
        }

        float A_t = y1 - y2;
        float B_t = x1 - x2;
        float C_t = (x2 - x1) * y1 - (y2 - y1) * x1;

        float temp = sqrt(A_t * A_t + B_t * B_t);

        for (int i = 0; i < RSample_poinsNum; i++) {
            float distance = abs(A_t * r_sample[i].x + B_t * r_sample[i].y + C_t) / temp;
            if (distance <= maxD) {
                inPlaneNum_t++;
                inliers.push_back(i);
            }
        }

        if (inPlaneNum_t > inPlaneNum_max) {
            inPlaneNum_max = inPlaneNum_t;
            A_best = A_t;
            B_best = B_t;
            C_best = C_t;
            D_best = temp;
            inPlaneNum_max = inPlaneNum_t;
            inliers_best = inliers;
        }
        iterNum++;
    }

    return inliers_best;
    
}

void process_pcd(string path,int mode){
    pcl::PointCloud<pcl::PointXYZ> raw_cloud;
    pcl::PCDReader reader;
    reader.read(path, raw_cloud);
    std::cout<<"-------------raw points----------------"<<std::endl;
    std::cout<<raw_cloud.size()<<std::endl;
    float maxD = 0.1;
    int iter_maxNum = 1000;

    cout<<"input distance threshold: ";
    cin>>maxD;
    cout<<"input max iteration number: ";
    cin>>iter_maxNum;
    vector<int> inliers;
    if (mode == 0)
        inliers = RANCAC_line(raw_cloud, iter_maxNum, maxD);
    else if (mode == 1)
        inliers = RANCAC_plane(raw_cloud, iter_maxNum, maxD);
    else if (mode == 2)
        inliers = RANCAC_sphere(raw_cloud, iter_maxNum, maxD);
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_inliter(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::copyPointCloud(raw_cloud, inliers, *cloud_inliter);
    pcl::PointCloud<pcl::PointXYZ>::Ptr raw_cloud_ptr(new pcl::PointCloud<pcl::PointXYZ>);
    raw_cloud_ptr = raw_cloud.makeShared();

    VisualizeCloud(raw_cloud_ptr, cloud_inliter);

}

int main(){
    string pcd_line_path = "../ransac_data/line.pcd", pcd_plane_path = "../ransac_data/plane.pcd", pcd_sphere_path = "../ransac_data/sphere.pcd";
    process_pcd(pcd_line_path,0);
    process_pcd(pcd_plane_path,1);
    process_pcd(pcd_sphere_path,2);
    return 0;
}
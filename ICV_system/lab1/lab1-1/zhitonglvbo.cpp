#include <iostream>
#include <string.h>
#include <pcl/io/pcd_io.h>
#include <pcl/io/io.h>

#include <pcl/point_types.h>
#include <pcl/point_cloud.h>

//lab1_1
#include <pcl/filters/passthrough.h>
//lab1_2
#include <pcl/filters/statistical_outlier_removal.h>
//lab1_3
#include <pcl/filters/random_sample.h>
#include <pcl/filters/voxel_grid.h>

#include <pcl/visualization/pcl_visualizer.h>
#include <boost/thread/thread.hpp>

using namespace std;

void VisualizeCloud(pcl::PointCloud<pcl::PointXYZ>::Ptr& cloud, pcl::PointCloud<pcl::PointXYZ>::Ptr& filter_cloud);

int main(){
	string cloud_path = "../commonData/bunny.pcd";

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);

	pcl::io::loadPCDFile(cloud_path.c_str(), *cloud);
	cout<<"加载点云 "<<cloud->points.size()<<"个"<<endl;

	// //---------直通滤波-----------------------

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::PassThrough<pcl::PointXYZ> pass;
	pass.setInputCloud(cloud);
	pass.setFilterFieldName("z");
	pass.setFilterLimits(0.0, 1.0);
	pass.setKeepOrganized(true);
	pass.setNegative(true);
	pass.filter(*cloud_filtered);
	cout<<"滤波后点云 "<<cloud_filtered->points.size()<<"个"<<endl;
	VisualizeCloud(cloud, cloud_filtered);

	//---------统计滤波-----------------------

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_OutRemove_filtered(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::StatisticalOutlierRemoval<pcl::PointXYZ> sor_OutRemove;
	sor_OutRemove.setInputCloud(cloud);
	sor_OutRemove.setMeanK(30);
	sor_OutRemove.setStddevMulThresh(1.0);
	sor_OutRemove.filter(*cloud_OutRemove_filtered);
	cout<<"滤波后点云 "<<cloud_OutRemove_filtered->points.size()<<"个"<<endl;
	VisualizeCloud(cloud, cloud_OutRemove_filtered);

	//---------点云降采样-----------------------

	//---------随机采样-----------------------

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_sub(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::RandomSample<pcl::PointXYZ> rs;
	rs.setInputCloud(cloud);
	rs.setSample(20000);
	rs.setSeed(1);
	rs.filter(*cloud_sub);
	cout<<"滤波后点云 "<<cloud_sub->points.size()<<"个"<<endl;
	VisualizeCloud(cloud, cloud_sub);

	//---------体素栅格滤波-----------------------

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_voxel(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::VoxelGrid<pcl::PointXYZ> vox;
	vox.setInputCloud(cloud);
	vox.setLeafSize(0.01f, 0.01f, 0.01f);
	vox.filter(*cloud_voxel);
	cout<<"滤波后点云 "<<cloud_voxel->points.size()<<"个"<<endl;
	VisualizeCloud(cloud, cloud_voxel);

	return 0;
}

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

        pcl::visualization::PointCloudColorHandlerGenericField<pcl::PointXYZ> fildColor_filtered(cloud, "z"); // 按照z字段进行渲染,将z改为x或y即为按照x或y字段渲染
	viewer->addPointCloud<pcl::PointXYZ>(filter_cloud, fildColor_filtered,"cloud_filtered", v2);
	//viewer->addCoordinateSystem(1.0);
	//viewer->initCameraParameters();
	while (!viewer->wasStopped())
	{
		viewer->spinOnce(100);
		boost::this_thread::sleep(boost::posix_time::microseconds(100000));
	}
}

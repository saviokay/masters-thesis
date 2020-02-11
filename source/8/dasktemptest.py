#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 02 22:26:55 2019
@author: saviokay
"""
import dask
import numpy as np
import xarray as xr
import glob
import matplotlib.pyplot as plt
import time
from dask_jobqueue import SLURMCluster
from dask.distributed import Client
import dask.multiprocessing

cluster = SLURMCluster(cores=16, memory='20GB', project='pi_jianwu', walltime='02:00:00', queue='high_mem', job_extra=['--qos=medium+'])
cluster.scale(5)
client = Client()

t0 = time.time()
total_pix = np.zeros((180, 360))
cloud_pix = np.zeros((180, 360))

def ingest_data(M03_dir, M06_dir):
    M03_files = sorted(glob.glob(M03_dir + "MYD03.A2008*.hdf"))
    M06_files = sorted(glob.glob(M06_dir + "MYD06_L2.A2008*.hdf"))
    for M03, M06 in zip (M03_files, M06_files):
        d06 = xr.open_mfdataset(M06[:], parallel=True)['Cloud_Mask_1km'][:,:,:].values
        d06CM = d06[::3,::3,0]
        ds06_decoded = (np.array(d06CM, dtype = "byte") & 0b00000110) >> 1
        d03_lat = xr.open_mfdataset(M03[:], drop_variables = "Scan Type", parallel=True)['Latitude'][:,:].values
        d03_lon = xr.open_mfdataset(M03[:], drop_variables = "Scan Type", parallel=True)['Longitude'][:,:].values

        lat = d03_lat[::3,::3]
        lon = d03_lon[::3,::3]

        l_index = (lat + 89.5).astype(int).reshape(lat.shape[0]*lat.shape[1])
        lat_index = np.where(l_index > -1, l_index, 0)
        ll_index = (lon + 179.5).astype(int).reshape(lon.shape[0]*lon.shape[1])
        lon_index = np.where(ll_index > -1, ll_index, 0)
        for i, j in zip(lat_index, lon_index):
            total_pix[i,j] += 1

        indicies = np.nonzero(ds06_decoded <= 0)
        row_i = indicies[0]
        column_i = indicies[1]
        cloud_lon = [lon_index.reshape(ds06_decoded.shape[0],ds06_decoded.shape[1])[i,j] for i, j in zip(row_i, column_i)]
        cloud_lat = [lat_index.reshape(ds06_decoded.shape[0],ds06_decoded.shape[1])[i,j] for i, j in zip(row_i, column_i)]

        for x, y in zip(cloud_lat, cloud_lon):
            cloud_pix[int(x),int(y)] += 1

    return cloud_pix, total_pix

dask.config.set(num_workers=5)
M03_dir = "/home/savio1/cybertrn_common/Data/Satellite_Observations/MODIS/MYD03//"
M06_dir = "/home/savio1/cybertrn_common/Data/Satellite_Observations/MODIS/MYD06_L2/"
future1 = client.submit(ingest_data,M03_dir,M06_dir)
result1 = client.gather(future1)

cf1 = future1.result()[0]/future1.result()[1]

plt.figure(figsize=(14,7))
plt.contourf(range(-180,180), range(-90,90), cf1, 100, cmap = "jet")
plt.xlabel("Longitude", fontsize = 14)
plt.ylabel("Latitude", fontsize = 14)
plt.title("Level 3 Cloud Fraction Aggregation For One Month With A Subsampling Of 3 And Parallelism [::3,::3]", fontsize = 16)
plt.colorbar()
plt.savefig("/umbc/xfs1/jianwu/common/MODIS_Aggregation/savioexe/test/8/test12345.png")

cf2 = xr.DataArray(cf1)
cf2.to_netcdf("/umbc/xfs1/jianwu/common/MODIS_Aggregation/savioexe/test/8/test12345.hdf")

t1 = time.time()
total = t1-t0
print(total)

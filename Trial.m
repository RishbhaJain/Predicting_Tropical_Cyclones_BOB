% link_geop='http://dap.ceda.ac.uk/thredds/dodsC/badc/cmip5/data/cmip5/output1/NCAR/CCSM4/rcp45/mon/atmos/Amon/r1i1p1/latest/zg/zg_Amon_CCSM4_rcp45_r1i1p1_200601-204912.nc';
% geop_1=netcdf.open(link_geop);
% [numdims,numvars,numglobalatts,unlimdimid] = netcdf.inq(geop_1);

fileName_msl_pred = 'psl_Amon_CCSM4_rcp60_r1i1p1_200601-210012.nc';
ncdisp(fileName_msl_pred);
var_msl_pred=ncread(fileName_msl_pred,'psl');
var_msl_pred=squeeze(var_msl_pred(77:96,5:24,180:1140));
var_msl_pred=permute(var_msl_pred,[2,1,3]);
msl_pred_new_1=zeros(5,20,961);
sum=zeros(5,20,961);
for i=0:4
      for j=1:4
          sum(i+1,:,:)=sum(i+1,:,:)+var_msl_pred(4*i+j,:,:)
      end    
    msl_pred_new_1(i+1,:,:)=sum(i+1,:,:)/4
end
sum=zeros(5,4,961);
msl_pred_new_2=zeros(5,4,961);
for i=0:3
    for j=1:5
        sum(:,i+1,:)=sum(:,i+1,:)+msl_pred_new_1(:,5*i+j,:)
      end    
    msl_pred_new_2(:,i+1,:)=sum(:,i+1,:)/5
end


%correlation analysis
msl_pred_cons=reshape(msl_pred_new_2(:,:,:),20,961);
% true=table2array(readtable('true.csv'));
msl_pred_cons=msl_pred_cons.'

fileName_geo_pred = 'zg_Amon_CCSM4_rcp60_r1i1p1_200601-204912.nc';
ncdisp(fileName_geo_pred);
var_geo_pred=ncread(fileName_geo_pred,'zg');
var_geo_pred=squeeze(var_geo_pred(77:96,5:24,6,180:528));
var_geo_pred=permute(var_geo_pred,[2,1,3]);
geo_pred_new_1=zeros(5,20,349);
sum=zeros(5,20,349);
for i=0:4
      for j=1:4
          sum(i+1,:,:)=sum(i+1,:,:)+var_geo_pred(4*i+j,:,:)
      end    
    geo_pred_new_1(i+1,:,:)=sum(i+1,:,:)/4
end
sum=zeros(5,4,349);
geo_pred_new_2=zeros(5,4,349);
for i=0:3
    for j=1:5
        sum(:,i+1,:)=sum(:,i+1,:)+geo_pred_new_1(:,5*i+j,:)
      end    
    geo_pred_new_2(:,i+1,:)=sum(:,i+1,:)/5
end


% %correlation analysis
geo_pred_cons=reshape(geo_pred_new_2(:,:,:),20,349);
%true=table2array(readtable('true.csv'));
geo_pred_cons=geo_pred_cons.'

fileName_geo_pred_2 = 'zg_Amon_CCSM4_rcp60_r1i1p1_205001-210012.nc';
ncdisp(fileName_geo_pred_2);
var_geo_pred_2=ncread(fileName_geo_pred_2,'zg');
var_geo_pred_2=squeeze(var_geo_pred_2(77:96,5:24,6,:));
var_geo_pred_2=permute(var_geo_pred_2,[2,1,3]);
geo2_pred_new_1=zeros(5,20,612);
sum=zeros(5,20,612);
for i=0:4
      for j=1:4
          sum(i+1,:,:)=sum(i+1,:,:)+var_geo_pred_2(4*i+j,:,:)
      end    
    geo2_pred_new_1(i+1,:,:)=sum(i+1,:,:)/4
end
sum=zeros(5,4,612);
geo2_pred_new_2=zeros(5,4,612);
for i=0:3
    for j=1:5
        sum(:,i+1,:)=sum(:,i+1,:)+geo2_pred_new_1(:,5*i+j,:)
      end    
    geo2_pred_new_2(:,i+1,:)=sum(:,i+1,:)/5
end
% 
% 
% % %correlation analysis
geo2_pred_cons=reshape(geo2_pred_new_2(:,:,:),20,612);
% %true=table2array(readtable('true.csv'));
geo2_pred_cons=geo2_pred_cons.';
combined_60=[geo_pred_cons;geo2_pred_cons];
combined_60=combined_60.*(9.80665)
combined_60=[combined_60, msl_pred_cons];
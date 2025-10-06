% 
% 
% 
% fileName_msl = 'seapressure_monthly.nc';
% ncdisp(fileName_msl);
% var_msl=ncread(fileName_msl,'msl');
% var_msl=squeeze(var_msl(:,:,1,:));
% msl_new_1=zeros(5,81,504);
% sum=zeros(5,81,504);
% for i=0:4
%       for j=1:14
%           sum(i+1,:,:)=sum(i+1,:,:)+var_msl(14*i+j,:,:)
%       end    
%     msl_new_1(i+1,:,:)=sum(i+1,:,:)/14
% end
% sum=zeros(5,4,504);
% msl_new_2=zeros(5,4,504);
% for i=0:3
%     for j=1:20
%         sum(:,i+1,:)=sum(:,i+1,:)+msl_new_1(:,20*i+j,:)
%       end    
%     msl_new_2(:,i+1,:)=sum(:,i+1,:)/20
% end
% % %correlation analysis
% msl_cons=reshape(msl_new_2(:,:,37:492),20,456);
% true=table2array(readtable('true.csv'));
% msl_cons=msl_cons.'
% 

% 
fileName_geo = 'geo_relhumid_monthly.nc';
ncdisp(fileName_geo);
% var_geo=ncread(fileName_geo,'z');
% var_geo=squeeze(var_geo(:,:,1,:));
%  geo_new_1=zeros(5,81,504);
% sum=zeros(5,81,504);
% for i=0:4
%       for j=1:14
%           sum(i+1,:,:)=sum(i+1,:,:)+var_geo(14*i+j,:,:)
%       end    
%     geo_new_1(i+1,:,:)=sum(i+1,:,:)/14
% end 
% sum=zeros(5,4,504);
% geo_new_2=zeros(5,4,504);
% for i=0:3
%     for j=1:20
%         sum(:,i+1,:)=sum(:,i+1,:)+geo_new_1(:,20*i+j,:)
%       end    
%     geo_new_2(:,i+1,:)=sum(:,i+1,:)/20
% end
% 
% geo_cons=reshape(geo_new_2(:,:,37:492),20,456);
% geo_cons=geo_cons.'
% geo_cons=[geo_cons true];
% geo_cons_train=geo_cons(1:400,1:56)
% geo_cons_test=geo_cons(401:456,1:56)
% 
% fileName_geo = 'geo_relhumid_monthly.nc';
% ncdisp(fileName_geo);
% var_rel=ncread(fileName_geo,'r');
% var_rel=squeeze(var_rel(:,:,1,:));
% rel_new_1=zeros(7,81,504);
% for i=1:7
%     rel_new_1(i,:,:)=var_rel(10*i,:,:);
% end
% rel_new_2=zeros(7,8,504);
% for i=1:8
%     rel_new_2(:,i,:)=rel_new_1(:,10*i,:);
% end
% %correlation analysis
% rel_cons=reshape(rel_new_2(:,:,37:492),56,456);
% rel_cons=rel_cons.'
% rel_cons=[rel_cons true];
% rel_cons_train=rel_cons(1:400,1:56)
% rel_cons_test=rel_cons(401:456,1:56)
% rel_corr=corrcoef(rel_cons)
%logistic regression
% true_train=categorical(true(1:400,:))
% true_test=true(401:456,:)
% cons_train=[geo_cons_train msl_cons_train rel_cons_train]
% [model1,dev,stats] = mnrfit(cons_train,true_train);
% cons_test=[geo_cons_test msl_cons_test rel_cons_test];
% y1_temp=mnrval(model1,cons_test);
% [maxp,y1_pred]=max(y1_temp,[],2);
% p=0;
% for i=1:57
%     y1_pred(i)=y1_pred(i)-1
%     if y1_pred(i)==true_test(i)
%         p=p+1
%     end
%     
% end

% fileName_wind = 'zonalwind_monthly.nc';
% ncdisp(fileName_wind);
% var_u1=ncread(fileName_wind,'u');
% var_u1=squeeze(var_u1(:,:,1,1,:));
% u1_new_1=zeros(7,81,504);
% for i=1:7
%     u1_new_1(i,:,:)=var_u1(10*i,:,:);
% end
% u1_new_2=zeros(7,8,504);
% for i=1:8
%     u1_new_2(:,i,:)=u1_new_1(:,10*i,:);
% end
% %correlation analysis
% u1_cons=reshape(u1_new_2(:,:,37:492),56,456);
% u1_cons=u1_cons.'
% u1_cons=[u1_cons true];
% u1_cons_train=u1_cons(1:400,1:56)
% u1_cons_test=u1_cons(401:456,1:56)

% var_u2=ncread(fileName_wind,'u');
% var_u2=squeeze(var_u2(:,:,2,1,:));
% u2_new_1=zeros(7,81,504);
% for i=1:7
%     u2_new_1(i,:,:)=var_u2(10*i,:,:);
% end
% u2_new_2=zeros(7,8,504);
% for i=1:8
%     u2_new_2(:,i,:)=u2_new_1(:,10*i,:);
% end
% %correlation analysis
% u2_cons=reshape(u2_new_2(:,:,37:492),56,456);
% u2_cons=u2_cons.'
% u2_cons=[u2_cons true];
% u2_cons_train=u2_cons(1:400,1:56)
% u2_cons_test=u2_cons(401:456,1:56)

% var_v2=ncread(fileName_wind,'v');
% var_v2=squeeze(var_v2(:,:,2,1,:));
% v2_new_1=zeros(7,81,504);
% for i=1:7
%     v2_new_1(i,:,:)=var_v2(10*i,:,:);
% end
% v2_new_2=zeros(7,8,504);
% for i=1:8
%     v2_new_2(:,i,:)=v2_new_1(:,10*i,:);
% end
% %correlation analysis
% v2_cons=reshape(v2_new_2(:,:,37:492),56,456);
% v2_cons=v2_cons.'
% v2_cons=[v2_cons true];
% v2_cons_train=v2_cons(1:400,1:56)
% v2_cons_test=v2_cons(401:456,1:56)

% var_v1=ncread(fileName_wind,'v');
% var_v1=squeeze(var_v1(:,:,1,1,:));
% v1_new_1=zeros(7,81,504);
% for i=1:7
%     v1_new_1(i,:,:)=var_v1(10*i,:,:);
% end
% v1_new_2=zeros(7,8,504);
% for i=1:8
%     v1_new_2(:,i,:)=v1_new_1(:,10*i,:);
% end
% %correlation analysis
% v1_cons=reshape(v1_new_2(:,:,37:492),56,456);
% v1_cons=v1_cons.'
% v1_cons=[v1_cons true];
% v1_cons_train=v1_cons(1:400,1:56)
% v1_cons_test=v1_cons(401:456,1:56)
% 
% 




 

    
           
        
            
    

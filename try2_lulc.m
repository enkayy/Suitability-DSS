global p1_m_n p1b_m_n p2value_o_p p2bvalue_o_p rp_q_s
global RGB pic x y v w ow1 ow2 cou1 cou2 cou3
global cb1_val cb2_val cb1 cb2

[pic, user_canceled1] = imgetfile;
[RGB, user_canceled2] = imgetfile;
%RGB = filename1
%pic = filename2

A = importdata(pic);
dat1 = A.cdata;
B = importdata(RGB);
dat2 = B.cdata;

%b = cdata(1)
%B = importdata(filename2)
%[RGB,map2] = imread('cdata');
%[pic,map1] = imread('B');
%image(A)

%[~,name,~] = fileparts('C:/Users/DougAnderson/Documents/MATLAB/SHtest/sig hole 1.xlsx')
%[~,name,ext] = fileparts(filename1)

%demo = imtool(filename1)
%hfigure = imtool()
%pict = imshow('name.tif') 
%map1
%[RGB,map2] = imread('hfigure');
% [pic,map1] = imread('lulctwo.tif');

            
info = imfinfo(pic);  % row * column
x = info.Height;
y = info.Width;

info2 = imfinfo(RGB);  % row * column
v = info2.Height;
w = info2.Width;


%[v,w]=size(B)



p1_m_n(x,y) = 0;
p1b_m_n(x,y) = 0;

p2value_o_p(v,w) = 0;
p2bvalue_o_p(v,w) = 0;

rp_q_s(x,y) = 0;

weight_1 = [12.5, 8, 18, 21, 4, 22, 19, 6, 25, 13, 17, 18];
count1 = size(weight_1);
cou1 = count1(2);
weight_2 = [12.5, 7, 5, 17, 20, 21, 15];
count2 = size(weight_2);
cou2 = count2(2);
netweight = [0.6 0.4];
count3 = size(netweight);
cou3 = count3(2);

ow1 = netweight(1);
ow2 = netweight(2);

for o = 1:x
    for p = 1:y
        
        p1_m_n(o,p) = squeeze( dat1(o,p,:) );
        
        p2value_o_p(o,p) = squeeze( dat2(o,p,:) );% impixel(RGB,o,p);% picking pixel value for 2nd image
        
        %p2(end+1) = p2value_o_p;
        
        if p1_m_n(o,p) == 0
            p1b_m_n(o,p) = weight_1(1) ;
        elseif p1_m_n(o,p) == 1
            p1b_m_n(o,p) = weight_1(2);
        elseif p1_m_n(o,p) == 2
            p1b_m_n(o,p) = weight_1(3);
        elseif p1_m_n(o,p) == 3
            p1b_m_n(o,p) = weight_1(4);
        elseif p1_m_n(o,p) == 4
            p1b_m_n(o,p) = weight_1(5);
        elseif p1_m_n(o,p) == 5
            p1b_m_n(o,p) = weight_1(6);
        elseif p1_m_n(o,p) == 6
            p1b_m_n(o,p) = weight_1(7);
        elseif p1_m_n(o,p) == 7
            p1b_m_n(o,p) = weight_1(8);
        elseif p1_m_n(o,p) == 8
            p1b_m_n(o,p) = weight_1(9);
        elseif p1_m_n(o,p) == 9
            p1b_m_n(o,p) = weight_1(10);
        elseif p1_m_n(o,p) == 10
            p1b_m_n(o,p) = weight_1(11);
        else
            p1b_m_n(o,p) = 18;
        end
            
        if p2value_o_p(o,p) == 0
            p2bvalue_o_p(o,p) = weight_2(1);
        elseif p2value_o_p(o,p) == 1
            p2bvalue_o_p(o,p) = weight_2(2);
        elseif p2value_o_p(o,p) == 2
            p2bvalue_o_p(o,p) = weight_2(3);
        elseif p2value_o_p(o,p) == 3
            p2bvalue_o_p(o,p) = weight_2(4);
        elseif p2value_o_p(o,p) == 4
            p2bvalue_o_p(o,p) = weight_2(5);
        elseif p2value_o_p(o,p) == 6;
            p2bvalue_o_p(o,p) = weight_2(6);
        else
            p2bvalue_o_p(o,p) = 15;
        end
        rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;    
    end
end
p1b_m_n;
p2bvalue_o_p;
rp_q_s;

imagesc(rp_q_s)

cval1 = 1;
cval2 = 2;
cval3 = 3;
 %c1 = get(c,'Value')
            %hold on
 
 %rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2; 
 
% descr = {'ow for img_1 = 0.60';
%     'ow for img_2 = 0.40'}

%LOC = [43 90 78 680];
%v = [0, 12]

Num = 25;
figure

cb1 = uicontrol('Style','checkbox',...
                'String','IMAGE-1',...
                'Value',1,'Position',[230 335 130 20],...
                'Callback',{@checkbox,cval1});
                       
cb1_val = get(cb1,'value');            
            
cb2 = uicontrol('Style','checkbox',...
                'String','IMAGE-2',...
                'Value',1,'Position',[630 335 130 20],...
                'Callback',{@checkbox,cval2});
            
cb2_val = get(cb2,'value');
            
colormap HSV % default is 'jet'.
set(gca,'Position',[.05 .05 .9 .9])
subplot(2, 3, 1);
%subimage();
imagesc(p1_m_n)
title('INPUT - 1')

%caxis(v)
cmap = hsv(13);
%ylim([0 14]) 
subplot(2, 3, 2);
%subimage(RGB);
imagesc(p2value_o_p)
title('INPUT - 2')
caxis([0, 8])

cmap = hsv(8);
subplot(2, 3, 3);
imagesc(rp_q_s)
title('OUTPUT')
%h = colorbar;
cmap = hsv(Num);                                          % assigen colormap
%colormap(cmap)
hold on

%subplot(2,3,4);
%f = figure('Position',[200 200 400 150]);
dat = { 12.5 ;8 ;18 ;21 ;4 ;22 ;19 ;6 ;25 ;13 ;17}; % rand(12,1);
cnames = {'weightage'}; 
rnames = {'First','2','3','4','5','6','7','8','9','10','11'};
t1 = uitable('Data',dat,'ColumnName',cnames,'RowName',rnames,...
    'Position',[140 40 150 200],'ColumnWidth',{60},...
    'CellEditCallback',{@newvalue,weight_1,cou1});
% t1 is the handle to object, used to access object.
set(t1,'ColumnEditable',true(1,3))
%t.CellEditCallback = @newvalue
%subplot(2,3,5);
%f = figure('Position',[200 200 400 150]);
dat2 = { 12.5 ;7 ;5 ;17 ;20 ;21};  % rand(8,1);
cnames = {'weightage'};
rnames = {'1','2','3','4','5','6'};
t2 = uitable('Data',dat2,'ColumnName',cnames,'RowName',rnames,...
    'Position',[620 40 150 170],'CellEditCallback',...
    {@newvalue,weight_2,cou2}); % If you specify ...
% this property as a function handle (or cell array containing a ...
% function handle), MATLAB passes an object containing callback data as the second argument to the callback function.
set(t2,'ColumnEditable',true(1,3))
%subplot(2,3,6);
set(gca,'xtick',[],'ytick',[])
L = line(ones(Num),ones(Num), 'LineWidth',8);               % generate line 
set(L,{'color'},mat2cell(cmap,ones(1,Num),3));            % set the colors according to cmap
legend('1','2','3','4','5','6','7','8','9','10','11','12','13',...
    '14','15','16','17','18','19','20','21','22','23','24','25')
legend('Location','East');
legend BOXOFF       % background box invisible
%set(h, 'ylim', [o 24])
%subplot(2,2,4);

%subplot(2,3,6);
%f = figure('Position',[200 200 400 150]);
dat3 = { 0.6 ;0.4}; % rand(3,1);
cnames = {'netweightage'};
rnames = {'IMAGE-1','IMAGE-2'};
t3 = uitable('Data',dat3,'ColumnName',cnames,'RowName',rnames,...
    'Position',[1000 60 160 100],'CellEditCallback',{@newvalue,netweight,cou3});
set(t3,'ColumnEditable',true(1,3))
impixelinfo

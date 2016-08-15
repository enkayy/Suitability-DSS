function [] = newvalue( hObject,callbackdata,array_handle,cou)
%UNTITLED Summary of this function goes here

%v = get(dat,groot,'factory')
% 
% numval = get(hObject);
% demo = callbackdata;
%  ar = array_handle;
%   Detailed explanation goes here
%     hObject
%r = get(hObject,)
     c = callbackdata.Indices
     index = c(1,1)
     %place = c(2)
     newval1 = callbackdata.NewData;
     %array_handle(index) = newval1;
     %val4 = array_handle( index );
     %hObject.Data{2,2} = 99
     count = cou; 
     %result_image(index,v,count) 
     
global p1_m_n p1b_m_n p2value_o_p p2bvalue_o_p rp_q_s
global RGB pic x y v w ow1 ow2 cou1 cou2 cou3
     
    if count == cou1
        for o = 1:x
            for p = 1:y
                p1_m_n(o,p) = squeeze( pic(o,p,:) );
                if p1_m_n(o,p) == index
                p1b_m_n(o,p) =  newval1;
                else
                    continue;
                end
                rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
            end
        end
    elseif count == cou2
        for o = 1:x
            for p = 1:y
                p2value_o_p(o,p) = squeeze( RGB(o,p,:) );% impixel(RGB,o,p);% picking pixel value for 2nd image
                if p2value_o_p(o,p) == index
                p2bvalue_o_p(o,p) = newval1;
                else
                    continue;
                end
                rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
            end
        end
    elseif count == cou3
        if index == 1
            for o = 1:x
                for p = 1:y
                    rp_q_s(o,p) = (p1b_m_n(o,p))*newval1 + (p2bvalue_o_p(o,p))*ow2;
                end
            end
        elseif index == 2
            for o = 1:x
                for p = 1:y
                    rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*newval1;
                end
            end
        end
    end
    
    %testing = 999
    ow1;
    count
    
    % p1b_m_n;
    % p2bvalue_o_p;
    % rp_q_s;
    subplot(2,3,3);
    imagesc(rp_q_s)

end
function [] = checkbox( hObject,callbackdata,imval )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

     
global p1_m_n p1b_m_n p2value_o_p p2bvalue_o_p rp_q_s
global RGB pic x y v w ow1 ow2 cou1 cou2 cou3
global cb1_val cb2_val cb1 cb2

val1 = get(hObject,'value')

cb1_val = get(cb1,'value');

cb2_val = get(cb2,'value');


%  
%  if (imval == 1) && (val1 == 0)
%      for o = 1:x
%          for p = 1:y
%              rp_q_s(o,p) = (p2bvalue_o_p(o,p))*ow2;
%              %rp_q_s(o,p) = (p1b_m_n(o,p))*newval1 + (p2bvalue_o_p(o,p))*ow2;
%          end
%      end
%  elseif (imval == 1) && (val1 == 1)
%      for o = 1:x
%          for p = 1:y
%              rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
%          end
%      end
%  end
%  
%  if (imval == 2) && (val1 == 0)
%      for o = 1:x
%          for p = 1:y
%              rp_q_s(o,p) = (p1b_m_n(o,p))*ow1;
%              %rp_q_s(o,p) = (p1b_m_n(o,p))*newval1 + (p2bvalue_o_p(o,p))*ow2;
%          end
%      end
%  elseif (imval == 2) && (val1 == 1)
%      for o = 1:x
%          for p = 1:y
%              rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
%          end
%      end
%  else
%      %rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
%  end
 
 if (cb1_val == 0) && (cb2_val == 1)        %(imval == 1) && (val1 == 0) && (cb2_val == 1)
     987
     for o = 1:x
         for p = 1:y
             rp_q_s(o,p) = (p2bvalue_o_p(o,p))*ow2;
             %rp_q_s(o,p) = (p1b_m_n(o,p))*newval1 + (p2bvalue_o_p(o,p))*ow2;
         end
     end
 elseif (cb1_val == 1) && (cb2_val == 0)        %(imval == 1) && (val1 == 1)
     978
     for o = 1:x
         for p = 1:y
             rp_q_s(o,p) = (p1b_m_n(o,p))*ow1;
         end
     end
 elseif (cb1_val == 1) && (cb2_val == 1)
     5678
     for o = 1:x
         for p = 1:y
             rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
             %rp_q_s(o,p) = (p1b_m_n(o,p))*newval1 + (p2bvalue_o_p(o,p))*ow2;
         end
     end
 else
     %rp_q_s(o,p) = (p1b_m_n(o,p))*ow1 + (p2bvalue_o_p(o,p))*ow2;
 end
 
 subplot(2,3,3);
 imagesc(rp_q_s)
 
 %work = 999
 
end

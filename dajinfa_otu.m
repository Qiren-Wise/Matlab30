clc
clear   % https://blog.csdn.net/qq_35608277/article/details/78594474
x=imread('rice.png');    
   a=x;
   subplot(211);  
   imshow(a,[]);  
   %[count x]=imhist(a);   
   [m,n]=size(a);   
   N=m*n;   
   L=256;   

for i=1:L  
    count(i)=length(find(a==(i-1)));  
    f(i)=count(i)/(N);  %ÿ���Ҷȶ�Ӧ�ĸ��ʣ�i=1,��Ӧ�Ҷ�ֵΪ0��i-1��
end  

for i=1:L   
    if count(i)~=0   
        st=i-1;   %��ʼ�ĻҶ�ֵ
        break;   
    end   
end   
for i=L:-1:1   
    if count(i)~=0   
        nd=i-1;   %�����ĻҶ�ֵ
        break;   
    end   
end   

p=st;   q=nd-st+1;   
u=0;   
for i=1:q   
    u=u+f(p+i)*(p+i-1);  %u�����ص�ƽ��ֵ    
    ua(i)=u;           %ua��i����ǰi+p�����ص�ƽ���Ҷ�ֵ  (ǰp����ȡֵ) 
end

for i=1:q   
    w(i)=sum(f(1+p:i+p));  %w��i����ǰi�����ص��ۼӸ���,��Ӧ��ʽ��P0 
end

w=w+eps;  
   %����sigmaB�Ĺ�ʽд��Ŀ�꺯����ʵ���Ǳ�������ֵ
d=(w./(1-w)).*(ua./w-u).^2;
[y,tp]=max(d);  %����ȡ����������ֵ��ȡ���ֵ�ĵ�   
th=tp+p;  

subplot(211);  
imshow(im2bw(x,graythresh(x)),[]);  title('matlab�Դ�');

subplot(212);  
imshow(im2bw(a,th/255),[]);  title('�Լ��������䷽��');



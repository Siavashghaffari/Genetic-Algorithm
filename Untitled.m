gen=0;
sigma=0;
sigA=0;
   for i=1:50
    t(i,:)=round(rand(1,8));
    b(i,:)=round(rand(1,8));
    l(i,:)=round(rand(1,8));
    h(i,:)=round(rand(1,8));
   end   
for o=1:100
    gen=gen+1;
    for i=1:50
    for j=1:8
        C(i,j)=t(i,j);
    end
    for j=1:8
        C(i,j+8)=b(i,j);
    end
    for j=1:8
        C(i,j+16)=l(i,j);
    end
    for j=1:8
        C(i,j+24)=h(i,j);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
    if h1-b1>=0
        S1=h1-b1;
    else
        S1=0;
    end   
    if 0.125-h1>=0
        S2=1-h1/.125;
    else
        S2=0;
    end    
     if 17-b1.*t1.^2>=0
        S3=1-b1.*t1.^2/17;
    else
        S3=0;
    end    
    if 1.5-h1.*l1>=0
        S4=1-h1.*l1/1.5;
    else
        S4=0;
    end    
    if 9-b1.*t1.^3>=0
        S5=1-b1.*t1.^3/9;
    else
        S5=0;
    end    
    if 0.03*t1+0.1-b1.*t1.^3>=0
        S6=0.3.*t1+1-10*b1.*t1.^3;
    else
        S6=0;
    end    
        L=50;
        A=100;
    F(i,:)=A-(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1+S1+S2+S3+S4+S5+S6);  
end
   for i=1:50
     sigma=sigma+F(i); 
   end
   %Roulette wheel selection
  for i=1:50 
    M=F(i)/sigma;
    sigA=sigA+M;
    p(i)=sigA;
  end
for i=1:50
a=rand;
 if (a>0)&(a<=p(1))
        Z(i,:)=C(i,:);
 end
for k=2:50
   if (a>p(k-1))&(a<=p(k))
        Z(i,:)=C(i,:);
   end
end
end
%Crossover
for i=1:25
    e=rand;
    Pc=0.7;
    g=ceil(50*rand);
c=ceil(50*rand);
U(i,:)=C(g,:);
V(i,:)=C(c,:);
d=ceil(rand*32);
    if e<=Pc
for j=1:32
if j<=d
    V1(i,j)=U(i,j);
    U1(i,j)=V(i,j);
else
    V1(i,j)=V(i,j);
    U1(i,j)=U(i,j);
end
end
else
    for j=1:32
         V1(i,j)=V(i,j);
    U1(i,j)=U(i,j);
    end
    end
end
for i=1:25
  for j=1:8
       t(i,j)=U(i,j);
    end
    for j=1:8
      b(i,j)=U(i,j+8);
    end
    for j=1:8
       l(i,j)=U(i,j+16);
    end
    for j=1:8
        h(i,j)=U(i,j+24);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
   if h1-b1>=0
        S1=h1-b1;
    else
        S1=0;
    end   
    if 0.125-h1>=0
        S2=1-h1/.125;
    else
        S2=0;
    end    
     if 17-b1.*t1.^2>=0
        S3=1-b1.*t1.^2/17;
    else
        S3=0;
    end    
    if 1.5-h1.*l1>=0
        S4=1-h1.*l1/1.5;
    else
        S4=0;
    end    
    if 9-b1.*t1.^3>=0
        S5=1-b1.*t1.^3/9;
    else
        S5=0;
    end    
    if 0.03*t1+0.1-b1.*t1.^3>=0
        S6=0.3.*t1+1-10*b1.*t1.^3;
    else
        S6=0;
    end    
        L=50;
    F1(i,:)=A-(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1+S1+S2+S3+S4+S5+S6); 
    for j=1:8
       t(i,j)=V(i,j);
    end
    for j=1:8
      b(i,j)=V(i,j+8);
    end
    for j=1:8
       l(i,j)=V(i,j+16);
    end
    for j=1:8
        h(i,j)=V(i,j+24);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
   if h1-b1>=0
        S1=h1-b1;
    else
        S1=0;
    end   
    if 0.125-h1>=0
        S2=1-h1/.125;
    else
        S2=0;
    end    
     if 17-b1.*t1.^2>=0
        S3=1-b1.*t1.^2/17;
    else
        S3=0;
    end    
    if 1.5-h1.*l1>=0
        S4=1-h1.*l1/1.5;
    else
        S4=0;
    end    
    if 9-b1.*t1.^3>=0
        S5=1-b1.*t1.^3/9;
    else
        S5=0;
    end    
    if 0.03*t1+0.1-b1.*t1.^3>=0
        S6=0.3.*t1+1-10*b1.*t1.^3;
    else
        S6=0;
    end    
        L=50;
    F2(i,:)=A-(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1+S1+S2+S3+S4+S5+S6);  
    for j=1:8
       t(i,j)=U1(i,j);
    end
    for j=1:8
      b(i,j)=U1(i,j+8);
    end
    for j=1:8
       l(i,j)=U1(i,j+16);
    end
    for j=1:8
        h(i,j)=U1(i,j+24);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
   if h1-b1>=0
        S1=h1-b1;
    else
        S1=0;
    end   
    if 0.125-h1>=0
        S2=1-h1/.125;
    else
        S2=0;
    end    
     if 17-b1.*t1.^2>=0
        S3=1-b1.*t1.^2/17;
    else
        S3=0;
    end    
    if 1.5-h1.*l1>=0
        S4=1-h1.*l1/1.5;
    else
        S4=0;
    end    
    if 9-b1.*t1.^3>=0
        S5=1-b1.*t1.^3/9;
    else
        S5=0;
    end    
    if 0.03*t1+0.1-b1.*t1.^3>=0
        S6=0.3.*t1+1-10*b1.*t1.^3;
    else
        S6=0;
    end    
        L=50;
    F3(i,:)=A-(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1+S1+S2+S3+S4+S5+S6);  
    for j=1:8
       t(i,j)=V1(i,j);
    end
    for j=1:8
      b(i,j)=V1(i,j+8);
    end
    for j=1:8
       l(i,j)=V1(i,j+16);
    end
    for j=1:8
        h(i,j)=V1(i,j+24);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
   if h1-b1>=0
        S1=h1-b1;
    else
        S1=0;
    end   
    if 0.125-h1>=0
        S2=1-h1/.125;
    else
        S2=0;
    end    
     if 17-b1.*t1.^2>=0
        S3=1-b1.*t1.^2/17;
    else
        S3=0;
    end    
    if 1.5-h1.*l1>=0
        S4=1-h1.*l1/1.5;
    else
        S4=0;
    end    
    if 9-b1.*t1.^3>=0
        S5=1-b1.*t1.^3/9;
    else
        S5=0;
    end    
    if 0.03*t1+0.1-b1.*t1.^3>=0
        S6=0.3.*t1+1-10*b1.*t1.^3;
    else
        S6=0;
    end    
        L=50;
    F4(i,:)=A-(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1+S1+S2+S3+S4+S5+S6);
    %Elliticism
    for j=1:32
    T(i,j)=U(i,j);
    T(i+25,j)=V(i,j);
    T(i+50,j)=U1(i,j);
    T(i+75,j)=V1(i,j);
    end
    T(i,33)=F1(i);
    T(i+25,33)=F2(i);
    T(i+50,33)=F3(i);
    T(i+75,33)=F4(i);
    vec=T(:,33);
end
  for i=1:50
  Fs=transpose(vec);
     m=max(Fs);
     n=find(Fs==m);
     q=n(1);
     for j=1:32
         T1(i,j)=T(q,j);
     end
     vec(q)=0;     
  end
  %Mutation
  for i=1:50
      for j=1:32
      Pm=.001;
      w=rand;
      if rand<Pm
          if T(i,j)==1
              T(i,j)=0;
          else
              T(i,j)=1;
          end   
      end
      end
  end
  for i=1:50
  for j=1:8
       t(i,j)=T1(i,j);
    end
    for j=1:8
      b(i,j)=T1(i,j+8);
    end
    for j=1:8
       l(i,j)=T1(i,j+16);
    end
    for j=1:8
        h(i,j)=T1(i,j+24);
    end
    t2=binvec2dec(t(i,:));
    b2=binvec2dec(b(i,:));
    l2=binvec2dec(l(i,:));
    h2=binvec2dec(h(i,:));
    t1=(5-1)/(2^8-1)*t2+1;
    b1=(5-1)/(2^8-1)*b2+1;
    l1=(10-2)/(2^8-1)*l2+2;
    h1=(1-.125)/(2^8-1)*h2+.125;
        L=50;
    Ft(i,:)=(h1.^2.*l1+L*b1.*t1+l1.*b1.*t1);
    
  end
  Fmean=sum(Ft)/50;
  Fmax=max(Ft);
  convergence=Fmean/Fmax
end  
  
  
  
  
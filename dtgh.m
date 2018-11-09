%���ǵ������ֱ��� c
%���ǵļ�ֵ�ֱ��� v
%���ڸ��������Ϊ n �ı���������ñ�����װ�����Ʒ�������ļ�ֵ�ܺͣ�
c=[2 3 1];
v=[31 47 15];
n=7;
Knapsack(c,v,n)


function Knapsack(c,v,n) %cΪ����������vΪ���Լ�ֵ��nΪ�ܳ���
m=length(c); %����Ʒ�������
f=zeros(m,n+1); %��¼��ֵ
x=zeros(m,n+1); %��¼���� xij��ʾ��i����Ʒ��ʣ�����Ϊjʱ�����������Ӧ����ĸ���

for i=m:-1:1
    for S=0:n %S��ʾ�����i����Ʒʱʣ��Ŀռ����ΪS
        if (i==m)
            f(i,S+1)=v(i)*floor(S/c(i));
            x(i,S+1)=floor(S/c(i));
        else
            xMax=floor(S/c(i));
            ff=zeros(xMax+1,1);
            for k=0:xMax
                ff(k+1)=v(i)*k+f(i+1,S-c(i)*k+1);
            end
            [f(i,S+1),index]=max(ff);
            x(i,S+1)=index-1;
        end
    end
end

[optValue,index]=max(f(1,:));%�ҳ����ֵ�������һ�γ��ֵ�λ��
pos=index;
fprintf('optimal solution:%d\n',optValue);

xx=zeros(m,1);  %��¼��ֵ����µ���Ʒ�ֱ����
xx(1)=x(1,index);
tempS=index;
for i=2:m %Ѱ�Ҽ�ֵ�������Ʒ����
   xx(i)=x(i,tempS-c(i-1)*xx(i-1));
   tempS=tempS-c(i-1)*xx(i-1);
end

for i=1:m
   fprintf('   put %d item%d in the bag\n',xx(i),i);
end

end


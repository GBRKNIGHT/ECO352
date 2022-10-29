lines = readlines("dataset_training for PS3 (1).txt");

filebyfield = regexp(lines, ',', 'split');
fieldarray = vertcat(filebyfield{:});
column1 = fieldarray(:, 1);
X = str2double(column1);
column2 = fieldarray(:, 2);
Y = str2double(column2);
column3 = fieldarray(:, 3);
xtrain = X;
ytrain = Y;
% BooleanVar = str2double(column3);
% Subquestion 1. 
% This is the output part of the scatter plot. 
% plot(scatter(X, Y));



% Subquestion 2. 
  iter=1000; % No. of iterations for weight updation
  
  theta=zeros(size(xtrain,2),1); % Initial weights
  
  alpha = 0.1; % Learning parameter

  sig_func = 1./(1+exp(-xtrain));
  plot(X, sig_func);
  disp sig_func

%  according to the generated graph, we accept.


% Subquestion 3, use matlab methods to perform log regression. 
theta1 = size(X);
[m1,n1] = size(column1);
[m2,n2] = size(column2);
Featrues = 300;
delta = 1;
num = 300;
L = [];
while(num)
    dt = zeros(1, 1);
    J = 0;
    for i=1:m1
        xx=X(i,1:1);
        yy=Y(i,1:1);
        h=1/(1+exp(-(theta1 * xx')));
        dt=dt+(h-yy) * xx;
        J=J+ yy*log(h)+(1-yy)*log(1-h);
    end
    J=-J/m1;
    L =[L,J];
    temp=theta1 - delta*dt/m1;
    theta1=temp;
    num = num - 1;
    if J<0.01
        break;
    end
end
figure
subplot(1,2,1)
plot(L)
title('Cost')
subplot(1,2,2)
x=0:0.1:10;
y=(-theta1(1)*x-theta1(3))/theta1(2);
plot(x,y)
hold on
plot(data(label==1,1),data(label==1,2),'g*')
hold on
plot(data(label==0,1),data(label==0,2),'r*')
axis([0 1 0 1])
axis equal



% % I am sorry that, I asked my classmates about this, and found
% instructions on internet. However, I cannot figure out how it works,
% hence there are no valid output for part 3. 


% Writtened sigmoid method in previous question. 
function sigmoid(x)
sig_function = 1./(1+exp(-x));
plot(x,sig_function);
end
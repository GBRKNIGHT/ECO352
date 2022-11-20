load datasetPS4.mat;
load accidents.mat;
format long;
hold on;
grid on;
divide = x\y;
b1 = regress(y,x);
yCalc1 = x*b1;
scatter (x,y);
plot(x,yCalc1)
Rsq1 = 1 - sum((y - yCalc1).^2)/sum((y - mean(y)).^2);
disp("Rsq1 = "+Rsq1);
N=length(y);
% % We can change the values of alpha and theta here.
theta = 0; 
alpha = 0;
h=theta*x;%hypothesis fuction.
% Formula to find cost function.
Error=(h-y).^2;
J=(1/(2*N))*sum(Error);
disp(J);
num_iter = 31;
for i=1:num_iter
Error=h-y;
delta=x'*Error;
theta=theta-(alpha/N)*sum(sum(delta));
h=theta*x;endError=(h-y).^2;
J=(1/(2*N))*sum(Error);
disp(J);
subplot(2,1,1);
plot(x,y,"ro","MarkerFacecolor","r");
hold on;
plot(x,h,"g-");
xlabel("x");
ylabel("y");
hold off;
subplot(2,1,2);
plot(theta,J,"bo","MarkerFacecolor","b");
end
plot(x,yCalc1)

% codes refer to 
% https://matlabhelper.com/blog/matlab/cost-function-in-matlab/

load ionosphere
rng(1);
disp("Below is the part of cross-validations: ");
SVMModel = fitcsvm(X,Y,'Standardize',true,'ClassNames',{'b','g'});
CVSVMModel = crossval(SVMModel)
FirstModel = CVSVMModel.Trained{1}
SecondModel = CVSVMModel.Trained{2}
ThirdModel = CVSVMModel.Trained{3}
FourthModel = CVSVMModel.Trained{4}
FifthModel = CVSVMModel.Trained{5}
SixthModel = CVSVMModel.Trained{6}
SeventhModel = CVSVMModel.Trained{7}
EighthModel = CVSVMModel.Trained{8}
NinthModel = CVSVMModel.Trained{9}
TenthModel = CVSVMModel.Trained{10}
disp("We can observe from the outputs above, the sixth " + ...
    "polynomial degree can help to minimize the bias, or the cost.")


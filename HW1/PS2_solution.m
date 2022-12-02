%    Annotated version for Yichen Li's 1st homework. 


%% Q2 Data generation
n = 10000; % sample size 
p = 100;    % number of nums 
X = randn(n,p);
X = [ones(n,1) X]; % generate random outputs
theta = (rand(p+1,1)-0.5)*2;
s2 = (p+1)/10;
Y = X * theta + randn(n,1) * sqrt(s2);

%% Q2 a)
tic % record the current time
theta_est = (X' * X) \ X' * Y; %calculate the expected theta value
timeOLS=toc;
fprintf('Time for OLS is: %f\n', timeOLS)

%% Q2 Setting Functions
% Objective function F(x) to minimize
F = @(theta) 0.5 * (Y - X * theta)' * (Y - X * theta)/n;

% Gradient of F (partial derivatives)
dF = @(theta) -X' * (Y - X * theta)/n;

%% Q2 b)
% Parameters
GAMMA = 1;    % step size (learning rate)
MAX_ITER = 1000;  % maximum number of iterations
FUNC_TOL = F(theta_est)*1.01;   % termination tolerance for F(x)
fvals = [];       % store F(x) values across iterations

% Iterate
iter = 1;         % iterations counter
x = zeros(p+1,1);    % initial guess
fvals(iter) = F(x);

tic % count the current time
while iter < MAX_ITER && fvals(end) > FUNC_TOL
    % while iterations times less than max and fvals greater than the
    % function
    iter = iter + 1;
    x = x - GAMMA * dF(x);  % gradient descent
    fvals(iter) = F(x);     % evaluate objective function
end
timeGD=toc;
fprintf('Time for Gradient Descent Method is: %f\n', timeGD)

%% Q2 c)
% Parameters
GAMMA = 1;    % step size (learning rate)
MAX_ITER = 1000;  % maximum number of iterations
FUNC_TOL = F(theta_est)*1.01;   % termination tolerance for F(x)
fvals = [];       % store F(x) values across iterations

% Iterate, to go through all of the test cases. 
iter = 1;         % iterations counter
x = zeros(p+1,1);    % initial guess
fvals(iter) = F(x); % reset

tic % time counter
while iter < MAX_ITER && fvals(end) > FUNC_TOL
    iter = iter + 1;
    x = x - GAMMA * ((X' * X / n) \ dF(x)); % Newton method
    fvals(iter) = F(x);     % evaluate objective function
end
timeNewton=toc; % reset time of newton method. 
fprintf('Time for Newton Method is: %f\n', timeNewton)

% Which of the three methods have the smallest running time depends on 
% the specific choices of n and p
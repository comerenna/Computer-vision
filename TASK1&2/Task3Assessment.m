a = readmatrix('a(1).csv');
x = readmatrix('x(1).csv');
b = readmatrix('b(1).csv');
y = readmatrix('y(1).csv');

% Mean
nx = a-x;

% Standard Deviation
ny = b-y;
histogram(nx);
histogram(ny);
% Real coordinates Trajectories
plot(x, y, 'xb');
hold;
% Noisy Trajectories
plot (a, b, '+r');

% kalmanFilter
[px, py] = kalmanfilterTracking([a;b]);
plot(px, py, 'g')


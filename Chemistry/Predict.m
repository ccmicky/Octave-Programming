%Initialization Settings
clear ; close all; clc

%Load up X and Y values
values = load('data.dat');

%Set X and Y data to the seperate columns
xdata = values(:, 1);
ydata = values(:, 2);

%Set Polyfit order and settings
order = input("\nPlease choose the order of the fitted polynomial: ");
p = polyfit(xdata, ydata, order);

%Edit space on graph and set variables
x = linspace(min(xdata), max(xdata), 101);
y = polyval(p, x);

xval = input("\nChoose an X-axis label: ", 's');
yval = input("\nChoose a Y-axis label: ", 's');

%Plot variables, set labels
plot(x, y, '-', xdata, ydata, 's');
axis([0, max(xdata), 0, max(ydata)]);
xlabel (xval);
ylabel (yval);
legend ('Fitted Line', 'Original Data', 'location', 'northwest');

b = input("\nChoose an Y value to calculate: ");

n = polyval(p, b);

fprintf("\nThe predicted Y value at X = %f is %f\n", b, n);
%printf("%s", p);

filename = input("\nPlease name the figure for the image. Remember to add the file extension\n", 's');
print(filename);
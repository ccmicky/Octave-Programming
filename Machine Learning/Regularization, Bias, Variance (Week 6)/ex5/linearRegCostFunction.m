function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Compute hypothesis (h), difference between h and y, and remove theta(0)
h = X * theta;
hdif = (h - y);
theta1 = [0; theta(2:size(theta), :)];

% Implement the cost function using the previously defined values (J = 1/2m*(h - y) + lambda/2m * theta1^2)
J = (1/(2*m)) * sum(hdif.^2);
penalty = (lambda / (2 * m)) * sum(theta1 .^ 2);
J = J + penalty;

% Calculate the gradient
grad = ((1/m) * (hdif' * X))' + ((lambda/m) .* theta1);







% =========================================================================

grad = grad(:);

end

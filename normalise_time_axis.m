function a = normalizetimeaxis(refsize,x)

% always pass in vector or vectors as a column vector(s) changes the time axis of the x to match the refrence size a = a = changetimeaxis(refsize,x)

num_vectors = min(size(x));
a = []; 
for j = 1 : num_vectors
targetsize = max(size(x));
xtemp = x(:,j);
for i = 1:refsize
    a(i,j) = xtemp(round(i*targetsize/refsize));
end

end

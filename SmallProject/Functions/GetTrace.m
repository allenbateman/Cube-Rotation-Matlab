function trace = GetTrace(matrix)
   a = 0;
    for i = 1:3
        a = a + matrix(i,i)
    end
    trace = a;
end


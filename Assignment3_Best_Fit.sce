//PES1201801482 - Yash Gawankar - 4J
function bestfit(A,b)
    x=(A' *A)\ (A'*b);
    disp (x, 'x=');
    C=x(1,1);
    D=x(2,1);
    disp(C,"C =");
    disp(D,"D =");
endfunction

A=[1 -1;1 1;1 2];
disp(A, 'A=');
b=[1;1;3];
disp(b, 'b=');
bestfit(A,b);
disp('The line of best fit -is b=C+Dt');

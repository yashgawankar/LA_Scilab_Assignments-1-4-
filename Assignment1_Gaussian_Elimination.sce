//PES1201801482 - Yash Gawankar - 4J
function gauss_elim(A,b)
    n=size(A,1);
    for k=1:n-1
        for i=k+1:n
            factor=A(i,k)/A(k,k);
            for j=k:n
                A(i,j)=A(i,j)-factor*A(k,j);
            end
            b(i)=b(i)-factor*b(k);
        end
    end

    x(n)=b(n)/A(n,n);
    for i=n-1:-1:1
        sum=0;
        for j=i+1:n
            sum=sum+A(i,j)*x(j);
        end
        x(i)=(b(i)-sum)/A(i,i);
    end

    disp([A,b],"Reduced Matrix:");
    disp(x,"Solution:");
endfunction

function LU(A)
    n=size(A,1);
    L = eye(n, n);
    for k=1:n-1
        for i=k+1:n
            factor=A(i,k)/A(k,k);
            L(i,k) = factor;
            for j=k:n
                A(i,j)=A(i,j)-factor*A(k,j);
            end
        end
    end
    disp(L,"L = ");
    disp(A,"U = ");
endfunction

function Inverse(A)
    n = size(A,1);
    Aug = [A,eye(n,n)];
    for j = 1:n-1
        for i = j+1:n
            Aug(i,j:2*n)=Aug(i,j:2*n)-Aug(i,j)/Aug(j,j) * Aug(j,j:2*n);
        end
    end
    for j = n:-1:2
        Aug(1:j-1,:) = Aug(1: j -1,:) - Aug(1:j-1,j)/Aug(j,j) * Aug(j,:);
    end
    for j = 1:n
        Aug(j,:) = Aug(j,:)/Aug(j,j);
    end
    B = Aug(:,n+1:2*n);
    disp(B,"Inverse = ");
endfunction

A = x_matrix("Enter coefficients", zeros(3,3))
b = x_matrix("Enter constants",zeros(3, 1))
disp(A,"A = ");
gauss_elim(A,b);
LU(A);
Inverse(A);

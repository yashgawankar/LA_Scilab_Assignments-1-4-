//PES1201801482 - Yash Gawankar - 4J
function col_span(a)
    [n,m] = size(a);
    disp("Column Span:");
    for i=1:n-1
        k = i
        while (a(i,k) == 0 && k <= m)
            k = k + 1;
        end
        for j = i+1:n
            if(a(i,k)<>0)
                a(j,:) = a(j,:) - (a(j,k)/a(i,k)) * a(i,:);
            end
        end
        disp(a);
    end
    for i=1:n
        for j=i:m
            if(a(i,j)<>0)
                a(i,:)=a(i,:)/a(i,j);
                break;
            end
        end
    end
    disp(a)
    for i=1:n
        for j=i:m
            if(a(i,j)<>0)
                disp('is a pivot column',j,'column');
                break
            end
        end
    end
endfunction

function fundamental_spaces(a)
    disp("Fundamental Spaces:");
    [m,n]=size(a);
    disp(m,'m is ');
    disp(n,'n is ');
    [v,pivot]=rref(a);
    disp(rref(a));
    disp(v);
    r=length(pivot);
    disp(r,'rank is ')
    cs=a(:,pivot);
    disp(cs,'Column Space is ');
    ns=kernel(a);
    disp(ns,'Null Space is ');
    rs=v(1:r,:)';
    disp(rs,'Row Space is ')
    lns=kernel(a');
    disp(lns,'Left Null Space is ');
endfunction

a = x_matrix("Enter matrix:",zeros(3,3));
disp(a,"a = ");
col_span(a);
fundamental_spaces(a);

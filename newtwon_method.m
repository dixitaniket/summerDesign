function ans = newtwon_method()
% the function is in the variable x
    syms x;
    
    f1=@(x) 2-x+log(x);
%     to find the diff of the function

    df1=matlabFunction(diff(f1(x)));
    
%     finding the initial point here
    x_old=3;
    x_new=0;
    tol=1e-7;
    max_iter=100;
    s=0;
    err=[];
    for i=1:max_iter
        
        x_new=x_old-(f1(x_old)/df1(x_old));
        
        
        if (abs((x_old)-(x_new))<tol)
            break;
        end
        s=s+1;
        err(s)=abs(x_new-x_old);
        x_old=x_new;
        
     
    end
    disp(x_new);
    plot(err(1:s-1),err(2:s));
%     for i=1:s
%         fprintf("%f\n",err(i));
%     end
%     
end           

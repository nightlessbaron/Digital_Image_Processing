clc; close all; clear all;

%% Image input and and Grad_op operator
Grad_op = [12 14 23 13; 14 11 21 18; 21 24 23 13; 12 21 20 10];
Image = [4 4 3 2; 3 7 6 1; 2 7 6 2; 0 1 0 2];
New_Matrix = zeros(4,4);

%% Algorithm
for i = 1:4
    for j = 1:4
        min_value = Grad_op(i,j);  
        x = i;
        y = j;
        if(i+1 <= 4 && Grad_op(i+1,j) < min_value)
            min_value = Grad_op(i+1,j);
            x = i+1;
            y = j;
        end
        if(i-1 >= 1 && Grad_op(i-1,j) < min_value)
            min_value = Grad_op(i-1,j);
            x = i-1;
            y = j;
        end
        if(j-1 >= 1 && Grad_op(i,j-1) < min_value)
            min_value = Grad_op(i,j-1);
            y = j - 1;
            x = i;
        end
        if(j+1 <= 4 && Grad_op(i,j+1) < min_value)
            min_value = Grad_op(i,j+1);
            y = j + 1;
            x = i;
        end
        if(j+1 <= 4 && i+1 <= 4 && Grad_op(i+1,j+1) < min_value)
            min_value = Grad_op(i+1,j+1);
            y = j+1;
            x = i+1;
        end
        if(j-1>= 1 && i+1 <= 4 && Grad_op(i+1,j-1) <min_value)
            min_value = Grad_op(i+1,j-1);
            y = j-1;
            x = i+1;
        end
        if(j + 1 <= 4 && i - 1 >= 1 && Grad_op(i-1,j+1) < min_value)
            min_value = Grad_op(i-1,j+1);
            y = j + 1;
            x = i - 1;
        end

        New_Matrix(i,j) = Image(x,y);
    end
end

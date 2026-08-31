clear;
clc;

% Student parameters
num_students = 5;
num_courses = 6;
credits =;
total_credits = sum(credits);

% Names and Registration Numbers
names = {'Student A', 'Student B', 'Student C', 'Student D', 'Student E'};
reg_nums = {'REG001', 'REG002', 'REG003', 'REG004', 'REG005'};

% Student marks matrix
marks = [
    85, 72, 80, 75, 82, 90;
    65, 70, 60, 68, 74, 55;
    92, 88, 95, 84, 90, 86;
    60, 55, 62, 58, 70, 65;
    50, 52, 58, 60, 48, 55
];

% Pre-allocating variables
gp_matrix = zeros(num_students, num_courses);
total_qp = zeros(num_students, 1);
gpa = zeros(num_students, 1);
cgpa = zeros(num_students, 1);

% Main processing loops
for i = 1:num_students
    qp_sum = 0;
    for j = 1:num_courses
        m = marks(i, j);
        
        % Grading criteria
        if m >= 80
            gp = 5.0;
        elseif m >= 75
            gp = 4.5;
        elseif m >= 70
            gp = 4.0;
        elseif m >= 65
            gp = 3.5;
        elseif m >= 60
            gp = 3.0;
        elseif m >= 55
            gp = 2.5;
        elseif m >= 50
            gp = 2.0;
        else
            gp = 0.0;
        end
        
        gp_matrix(i, j) = gp;
        qp_sum = qp_sum + (gp * credits(j));
    end
    
    total_qp(i) = qp_sum;
    gpa(i) = total_qp(i) / total_credits;
    cgpa(i) = gpa(i);
end

% Displaying results line by line
fprintf('Name\t\tReg No\t\tTotal QP\tGPA\t\tCGPA\n');
fprintf('------------------------------------------------------------\n');
for i = 1:num_students
    fprintf('%s\t%s\t%d\t\t%.4f\t%.4f\n', names{i}, reg_nums{i}, total_qp(i), gpa(i), cgpa(i));
end

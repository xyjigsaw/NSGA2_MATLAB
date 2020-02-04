function nsga_2_optimization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�˴����Ը���
%�������ѧϰ���������omegaxyz.com
pop = 500; %��Ⱥ����
gen = 500; %��������
M = 2; %Ŀ������
V = 30; %ά��
min_range = zeros(1, V); %�½�
max_range = ones(1,V); %�Ͻ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chromosome = initialize_variables(pop, M, V, min_range, max_range);
chromosome = non_domination_sort_mod(chromosome, M, V);

for i = 1 : gen
    pool = round(pop/2);
    tour = 2;
    parent_chromosome = tournament_selection(chromosome, pool, tour);
    mu = 20;
    mum = 20;
    offspring_chromosome = genetic_operator(parent_chromosome,M, V, mu, mum, min_range, max_range);
    [main_pop,~] = size(chromosome);
    [offspring_pop,~] = size(offspring_chromosome);
    clear temp
    intermediate_chromosome(1:main_pop,:) = chromosome;
    intermediate_chromosome(main_pop + 1 : main_pop + offspring_pop,1 : M+V) = offspring_chromosome;
    intermediate_chromosome = non_domination_sort_mod(intermediate_chromosome, M, V);
    chromosome = replace_chromosome(intermediate_chromosome, M, V, pop);
    if ~mod(i,100)
        clc;
        fprintf('%d generations completed\n',i);
    end
end

if M == 2
    plot(chromosome(:,V + 1),chromosome(:,V + 2),'*');
    xlabel('f_1'); ylabel('f_2');
    title('Pareto Optimal Front');
elseif M == 3
    plot3(chromosome(:,V + 1),chromosome(:,V + 2),chromosome(:,V + 3),'*');
    xlabel('f_1'); ylabel('f_2'); zlabel('f_3');
    title('Pareto Optimal Surface');
end
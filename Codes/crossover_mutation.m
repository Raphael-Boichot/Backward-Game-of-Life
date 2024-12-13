function [child] = crossover_mutation(DNA_bank,best_population,crossover_probability,mutation_probability)
parent_1=DNA_bank(ceil(rand*best_population),:);
parent_2=DNA_bank(ceil(rand*best_population),:);
child=zeros(1,length(parent_1));
sign=1;
for i=1:1:length(parent_1)
    if rand<crossover_probability
        sign=sign*-1;
    end
    if sign==1
        child(i)=parent_1(i);
    else
        child(i)=parent_2(i);
    end
    if rand<mutation_probability
        child(i)=rand<0.5;
    end
end
clc
clear
close all

rng('shuffle', 'twister')
try
    rmdir('Figure','s');
catch
    disp('Folder not present')
end
mkdir('Figure');
figure('Position',[100 100 1400 800]);
colormap(hot)
target=imread('Target.png');
target=target(:,:,1);
colors=unique(target);
target_normalized=(target==colors(1))*0+(target==colors(2))*1;
[height,width]=size(target);
epoch=25;
population=5000;
best_population=500;
crossover_probability=0.05;
mutation_probability=0.005;

DNA_bank= rand(population,height*width)>0.5;
new_DNA_bank=zeros(population,height*width);
fitness=zeros(population,1);
pool=zeros(height, width, population);
fitness_hist=[1e9];

for counter=1:1:50000
    tic
    parfor i=1:population
        pool(:,:,i)=game_of_life(DNA_bank(i,:), epoch, height,width);
        fitness(i,1)=sum(sum(abs(target_normalized-pool(:,:,i))));
    end

    struct_sort=sortrows([fitness,DNA_bank],1,'ascend');
    DNA_bank=struct_sort(:,2:end);

    parfor i=1:population
        new_DNA_bank(i,:)=crossover_mutation(DNA_bank,best_population,rand*crossover_probability,rand*mutation_probability);
    end
    new_DNA_bank(1,:)=DNA_bank(1,:);
    fitness_hist=[fitness_hist,struct_sort(1,1)];
    toc
    subplot(2,2,1)
    imagesc(log(reshape((sum(DNA_bank)),[height,width])))
    title('Average of starting configurations')
    subplot(2,2,2)
    imagesc(log(sum(pool(2:end-1,2:end-1,:),3)))
    title('Average of ending configurations')
    subplot(2,2,3)
    if counter>1
        loglog(fitness_hist(2:end),'b.')
    end
    title('Fitness')
    DNA_bank=new_DNA_bank;
    best_DNA=DNA_bank(1,:);
    imwrite(reshape(best_DNA,[height,width]),'Best_start.png')
    [space_after]=game_of_life(best_DNA, epoch, height,width);
    subplot(2,2,4)
    imagesc(target_normalized+2*space_after)
    title('Best solution + target');
    fontsize(16,"points")
    drawnow
    if not(fitness_hist(end)==fitness_hist(end-1))
        disp('New optimum found')
        saveas(gcf,['Figure\Figure_',num2str(counter,'%06.f')],'png');
    end
    imwrite(space_after,'Best_end.png')
end


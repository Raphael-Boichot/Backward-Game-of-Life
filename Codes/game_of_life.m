function [space_after]=game_of_life(space_before, epoch,height,width)

space_before=reshape(space_before,[height,width]);
space_after= zeros(height,width);
for n=1:1:epoch
    %periodic boundary conditions
    h1=space_before(:,2);
    h2=space_before(:,width-1);
    l1=space_before(2,:);
    l2=space_before(height-1,:);

    space_before(:,width)=h1;
    space_before(:,1)=h2;
    space_before(1,:)=l2;
    space_before(height,:)=l1;

    for i=2:1:(height-1)
        for j=2:1:(width-1)
            living_cells = space_before(i,j+1)+space_before(i,j-1)+space_before(i-1,j)+space_before(i+1,j)+space_before(i+1,j+1)+space_before(i+1,j-1)+space_before(i-1,j+1)+space_before(i-1,j-1);
            if (space_before(i,j)==0 && living_cells == 3); space_after(i,j)=1; end;
            if (space_before(i,j)==1 && (living_cells>3 || living_cells<2)); space_after(i,j)=0; end;
        end
    end
    space_before=space_after;
end
space_after=not(space_after);
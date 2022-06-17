function path = RRT_run(source,goal,i)
global circleCenter r tmp hpath
%% 参数
% source=[500 -650 0];
% goal=[500 -500 400];

ReduceObject(i);

stepsize = 30;
threshold = 20;
% stepsize = 30;
% threshold = 25;
maxFailedAttempts = 10000;
display = true;
searchSize = [250 250 250];      %探索空间六面体

%% 绘制起点和终点
figure(2)
scatter3(source(1),source(2),source(3),'filled','g');
scatter3(goal(1),goal(2),goal(3),'filled','b');

tic;  % tic-toc: Functions for Elapsed Time
RRTree = double([source -1]);
failedAttempts = 0;
pathFound = false;
%% 主循环
while failedAttempts <= maxFailedAttempts  % loop to grow RRTs
    %% chooses a random configuration
    if rand < 0.5
        sample = rand(1,3) .* searchSize;   % random sample
    else
        sample = goal; % sample taken as goal to bias tree generation to goal
    end
    %% selects the node in the RRT tree that is closest to qrand
    [A, I] = min( distanceCost(RRTree(:,1:3),sample) ,[],1); % find the minimum value of each column
    closestNode = RRTree(I(1),1:3);
    %% moving from qnearest an incremental distance in the direction of qrand
    movingVec = [sample(1)-closestNode(1),sample(2)-closestNode(2),sample(3)-closestNode(3)];
    movingVec = movingVec/sqrt(sum(movingVec.^2));  %单位化
    newPoint = closestNode + stepsize * movingVec;
    if ~checkPath(closestNode, newPoint, circleCenter,r) % if extension of closest node in tree to the new point is feasible
        failedAttempts = failedAttempts + 1;
        continue;
    end
    
    if distanceCost(newPoint,goal) < threshold  % goal reached
        pathFound = true; 
        break; 
    end 
    [A, I2] = min( distanceCost(RRTree(:,1:3),newPoint) ,[],1); % check if new node is not already pre-existing in the tree
    if distanceCost(newPoint,RRTree(I2(1),1:3)) < threshold, failedAttempts = failedAttempts + 1; continue; end 
    
    RRTree = [RRTree; newPoint I(1)]; % add node
    failedAttempts = 0;
    if display
        figure(2);plot3([closestNode(1);newPoint(1)],[closestNode(2);newPoint(2)],[closestNode(3);newPoint(3)],'LineWidth',1); end
    pause(0.05);
end

if display && pathFound, figure(2);plot3([closestNode(1);goal(1)],[closestNode(2);goal(2)],[closestNode(3);goal(3)]); end

% if display, disp('click/press any key'); waitforbuttonpress; end
if ~pathFound, error('no path found. maximum attempts reached'); end

% 半径恢复
r(i) = tmp;

%% 回溯规划轨迹 retrieve path from parent information
path = goal;
prev = I(1);
while prev > 0
    path = [RRTree(prev,1:3); path];
    prev = RRTree(prev,4);
end

pathLength = 0;
for i=1:length(path(:,1))-1, pathLength = pathLength + distanceCost(path(i,1:3),path(i+1,1:3)); end % calculate path length
fprintf('processing time=%d \nPath Length=%d \n\n', toc, pathLength); 

figure(2);
% scatter3(source(1),source(2),source(3),'filled','g');
% scatter3(goal(1),goal(2),goal(3),'filled','b');
hpath = plot3(path(:,1),path(:,2),path(:,3),'LineWidth',2,'color','r');
view(125,50);
axis([-1300,1300,-2300,2300,-600,2300]);
xlabel('x');
ylabel('y');
zlabel('z');

end
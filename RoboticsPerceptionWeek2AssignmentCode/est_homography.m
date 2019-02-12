function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE
Ax = zeros(4, 9);
Ay = zeros(4, 9);
A = [];
for i = 1:4
    Ax(i,:) = [-video_pts(i, 1) -video_pts(i, 2) -1 0 0 0 ...
        video_pts(i, 1)*logo_pts(i, 1) video_pts(i, 2)*logo_pts(i, 1) logo_pts(i, 1)];
    Ay(i,:) = [0 0 0 -video_pts(i, 1) -video_pts(i, 2) -1 ...
        video_pts(i, 1)*logo_pts(i, 2) video_pts(i, 2)*logo_pts(i, 2) logo_pts(i, 2)];
    A = [A;Ax(i, :); Ay(i, :)]
end
[U S V] = svd(A);
H = [V(1, end) V(2, end) V(3, end);
     V(4, end) V(5, end) V(6, end); 
     V(7, end) V(8, end) V(9, end)];

end


# Full Pose information
std_msgs/Header             header
#
float32[162]    xpred   # predictive x; xpred_0 .. xpred_26 times 6 states
float32[162]    xtraj   # desired trajectory; xtraj_0 .. xtraj_26 times 6 states
float32[104]    u       # predictive u; u_0 .. u_25 times 4 states
float32[9]      xo      # obstacle state (x, xd, xdd)
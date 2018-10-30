# Robotics Assignment 2

---

### Caleb Adams

## Compile

source the setup within the repo folder with:
`source devel/setup.bash`

then run `catkin_make` within the repo folder.

*note:* the repo and project folder names may differ! If you rename the project folder name to `assignment_2` after pulling everything should be fine.

## Running:

First run:
`roslaunch adams_p2 stage_rviz.launch`

then, open a new terminal and run:
`roslaunch adams_p2 extract_all.launch`

## Evaluation

Performance is decent, but relativley poor compaired to what I would have expected. This is likely a result of my haisty implementation. There seems to be a line that is drawn between certain outliers that does not fit the data pretty consistently, though this occurs only once typically. Other lines fit the data very well. In general, it works but there may be some issues with edge cases of line enpoints.


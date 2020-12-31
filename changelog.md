### 2020-11-22
got organized (put everything into asana)

### 2020-11-26 
* fixed errors in labels that stopped Cohen's D script from working
* started thinking about the problem of study needs to have one behavioural outcome and one attitudinal

### 2020-11-30
* new idea for a graph: 
  * show how effect size changes as you move from everything, to just attitudes (goes up), to just behaviors(goes down) to just RCT attitudes (not sure) to RCT behaviors (lowest). How to portray this?
* solved a few technical things -- group_by and then variable contains ALL of values, and a unique_study_id
* have some preliminary results to dicsuss about the diminishing effects as you go up the scale in terms of study quality and behavirs
* but do attitudes predict behaviors? This one is actually a hard question. Talk to Don & Betsy about it?

### 2020-12-01
* We have a lot more double-checking to do in the first cleaning script.
* Solved the correlation thing, it wasn't so hard once I knew what the right function was.
* The next big thing was behavior types and delay

#### 2020-12-02
* Small cleaning stuff. Need to double-check everything in 1-download-and-clean-data once Roni is done

### 2020-12-05
* I thought there was 30 minutes of work to do tonight but it was more like 2 hours. Time well spent
* Fixed the delay metric, I think (though, ultimately, we need a delay yes/no. Maybe we should call it delay_yes_no :))
* I think we should put redlined studies in their own tab (tell Roni)
* I took a first, really rough stab at categorizing the behavior types, but this is going to need serious revision
* Emailed the whole team! Really much easier to do the analysis for this  knd of paper having done it twice before. not only because we have a good sense of what functions and stuff to use but also because I have an intuition about rabbit holes best avoided and how we're likely to frame the argument in the end.
* Graphs and stuff, that we need to do. + all the data and code cleaning and everything. it's fine

### 2020-12-26
* Addewd a git remote and by instructions [here](https://stackoverflow.com/questions/1818895/keep-ignored-files-out-of-git-status) I ignored some files but this time it worked
* Used pivot_wider to make the attitudes correspondence thing easier to plot via ggplot
### 2020-12-30
* Fixed a small thing about the attitudes behavior correspondence. 
* New idea for the plot about this is to mutate a new variable that calculates individual correspondences and then plots *those* by mean(se_attitudes_d + se_behavior_d) and that would show if there's more of a correspondence as things get higher-powered.
* That will go next to , or in addition to, a simple X = attitudes D and Y = behavior D plot.
* last but not least is a forest plot of each study but...i have to learn how to do that.
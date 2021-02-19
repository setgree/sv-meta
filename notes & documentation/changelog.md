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
* Added a git remote and by instructions [here](https://stackoverflow.com/questions/1818895/keep-ignored-files-out-of-git-status) I ignored some files but this time it worked
* Used pivot_wider to make the attitudes correspondence thing easier to plot via ggplot

### 2020-12-30
* Fixed a small thing about the attitudes behavior correspondence. 
* New idea for the plot about this is to mutate a new variable that calculates individual correspondences and then plots *those* by mean(se_attitudes_d + se_behavior_d) and that would show if there's more of a correspondence as things get higher-powered.
* That will go next to , or in addition to, a simple X = attitudes D and Y = behavior D plot.
* last but not least is a forest plot of each study but...i have to learn how to do that.

### 2020-01-19 
* Welcome back after 3 weeks off 
* Got a lot further towards complete plots, which I feel good about
* The forest plot with one attitude, one behavior eludes me
* But I think a ggplot forest plot is the way to go because I won't be fiddling in the dark so much
* Just now fixed the forest plot so it's one *per paper* rather than one per study

### 2020-02-07
* I have been reading papers, not as well as I might; I forgot to record notes last time
* not sure what to make of Foshee. the number of schools is few; the results reported in the tables and the text make it seem like nothing happened (esp. not behaviorally) and also the baseline levels of SV are, this is impolite to say but incredibly high for 7th and 8th graders (are most of them really active romantically at all?); then the follow-ups find large persistent results. hmm
  * in light of this, make sure the Ns are correct for cluster > 10 studies -- still need N to be number of groups and not
* Banyard 2007: there's an easy explanation for why the results seem to get a lot bigger as time goes on: men didn't respond to the follow-up survey. We don't get attrition reported by treatment condition and gender but presumably there's something there.
### 2020-02-208
* Moynihan 2010: certainly looks like some consistent (not too large) positive effects of treatment.Differential attrition is a potential issue here (though they report it forthrightly, which is great). It's interesting that they call the effects on bystander *behavior* nulll but not the effects on attitudes; in magnitude, they're not all that different at a glance.
* Cares 2015; in some ways, this paper is typical of what makes social science papers so hard to read -- parsing this results section is such a mess. (Why do researchers so often bury the lede? Your first hypothesis should be your main contention _and it should lead the results section_.) In others, I liked that this paper is sensitive to how norms and context can affect a treatment's efficacy. Key quotes:
>  it may be that more adaptation of the pro- gram to the realities of Campus 2 was needed, with particular attention to how that might differ by gender. (p. 181)
&
> This evaluation on two different campuses highlights that there are important distinctions to be made in terms of who it works for and how— in this case, how it works differently for women and men, how it works differently between campuses, and how it works differently by gender between campuses. This is an important lesson for the prevention field, which often wants one-time, low-resource, prevention tools that can easily apply to many communities. Social change efforts for problems as complex as sexual and relationship violence will require more. (p. 179). 
I also note the lack of behavioral interventions.
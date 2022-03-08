Hi John-Henry and Roni,

Hope you are well. Just sent the entire group a big picture summary. Writing to you two specifically with more details about what's left on the data cleaning front.

Today I gave JH a high-level overview of my 1) data cleaning 2) Cohens D and 3) meta-analysis scripts. I think he's going to understand everything pretty well because, to be frank, I copied the heck out of his work on the prejudice meta.

Here are our outstanding to-dos, as I see them.

1) I 'pinklined' a bunch of studies in the primary prevention sheet. This means I recommend redlining them; I left a comment in the comment column each time to say why.  IN general, it's because I couldn't figure out enough information to estimate an effect size (e.g. ctrl_sd was missing). for the most part, this is observational and quasi-experimental research. I'd appreciate someone else going over these and giving a final verdict (i.e. redlining them or finding the info I couldn't).

2) Because we want to figure out the relationship between interventions and different kinds of behaviors, I think we need to clean the scale_name up a bit. In particular:
If something says SES, we should clarify whether it's victimization, perpetration or both; in any case, we could follow up the scale_name with just "(perpetration)" or something like that.
If they presented SES stats differently for men and women, we should disaggregate them when possible (I did this in the one study I came across where they were aggregated).
If the behavior can be classified as "bystander intervention", "participation," or simply "other", that would be great.
3) I made a judgment call about standard errors and study designations as follows:
If an RCT has 3 or fewer groups, it's not an RCT at all and I relabeled it as quasi-experimental (you can't expect equivalence in expectation if you have just one group in the control).
If it had between 4 and 10 groups (inclusive), I called it a 'pragmatic RCT'. I read this in the literature somewhere and I think it's a nice way of saying -- this is an RCT but it was limited and exploratory. I think we discussed this in one of our previous meetings...
For RCTs and pragmatic RCTs, I use the n_t_group and n_c_group to calculate the standard error of Cohen's D, but for everything else, I just use n_t_post and n_c_post. This was for a few reasons. First, for a non-RCT study, whether they were assigned all at once or assigned one by one, it makes little difference as we have no reason to assume that there is no equivalence between groups in expectation. Second, more practically, some studies have so few groups that you literally can't calculate the variance if we use the n_t_group and n_c_groups in the calculator (you need at least 4 groups to get a meaningful number).
All of the ^ has the effect of, unfortunately, holding the best studies -- the RCTs and the pragmatic RCTs -- to higher standards than the other studies because we're effectively saying that they have higher variance than the studies that assigned at the group level but weren't randomized. I think this is ok because we ultimately compare the RCTs to everything else and focus on the RCTs as the highest-quality evidence.
I would be happy to write up something about this when it comes time to write the statistical appendices.
5) for the prejudice meta, y'all averaged Ds within each study and came up. with an average estimate per study. We could do that here too. In general, I don't think it made much difference in the overall estimates, and also, in this study, we often want to look at multiple things within any given study (e.g. effects on victimization, perpetration, and attitudes separately), so I personally favor leaving things ungrouped. If we _do_ group, JH suggests maybe grouping within gender? This might be hard because so many studies don't report stats separately.

6) there's something interesting and worth discussing about "iatrogenic" effects (it means "relating to illness caused by medical examination or treatment.") If you look at the three Bruce Taylor et al. studies,you'll see a different iatrogenic finding each time, each time explained differently. The overall problem here is: if a study leads to increased reporting of harassment victimization, does that mean that victimization went up, or that reporting went up because people know what to call what happened to them?

7) Our "scale_type" variable right now is just attitudes and behaviors. IMO, there's also knowledge; a lot of the outcome variables are things like "identifying three types of harassing behavior". It might be a lot of work but I think the study might benefit from reclassifying all of those.

So, I'm more or less going off-grid for the next five months, but I'll have my
cell phone! And if we ever do get together to write, as I said, I'll happily get
off trail to finish up. But that's where we stand, I think.

Roni, I'll look forward to seeing you virtually next week.

Best

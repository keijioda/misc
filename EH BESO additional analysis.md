# EH BESO additional analysis

## Inflamamatory/oxidative markers by sex
- Previously, in order to examine if the treatment effect exists, for each outcome we ran a mixed model that include:
  - Treatment (soy/placebo), time (pre/post), interactions between treatment x time, sequence, phase, and wave as fixed-effects terms
  - Subjects as a random-effects term

- To examine if the effect of treatment is different between genders, we further added gender and the 3-way interaction of treatment x time x gender. If the 3-way interaction is significant, this would suggest that the treatment effect is different between genders and we will need to procced to stratified analysis by gender.

- Among all the inflammatory/oxidative markers (hsCRP, IL-1, IL-1ra, IL-6, TNF-a, haptoglobin, TAS, TBARS), the 3-way interaction was found to be significant only on TNF-a (*p* = 0.0182) and TAS (*p* = 0.0322). Thus for these two outcomes, we proceeded to gender-stratified analysis:

```
                 Pre               Post              Ratio (Post/Pre)  Within  Between
             Trt Mean  Lower Upper Mean  Lower Upper Mean  Lower Upper P-val   P-val
======================================================================================
TNF-a Female  A  0.89  0.66  1.19  0.73  0.54  0.99  0.82  0.66  1.02  0.0205  0.1040
              B  0.89  0.66  1.19  0.88  0.65  1.20  0.99  0.80  1.24  0.9490 
      Male    A  1.30  0.93  1.81  1.32  0.63  2.78  1.02  0.27  3.89  0.9646  0.2709
              B  2.05  1.47  2.85  1.04  0.49  2.17  0.51  0.13  1.93  0.1425 
TAS   Female  A  1.91  1.78  2.05  1.98  1.85  2.13  1.04  0.96  1.13  0.2317  0.9113
              B  1.81  1.69  1.94  1.89  1.76  2.02  1.04  0.96  1.13  0.1851 
      Male    A  1.92  1.64  2.25  2.31  1.97  2.71  1.20  0.96  1.51  0.0323  0.0634
              B  2.08  1.78  2.44  2.01  1.72  2.36  0.97  0.77  1.22  0.6577 
======================================================================================
```
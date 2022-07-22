A GitHub flavored Markdown textfile documenting a dataset.

Generated using [docdata package](https://hauselin.github.io/docdata/) on 2021-09-28 08:55:10.
To cite this package, type citations("docdata") in console.

## Data source

data.csv

## About this file

* What (is the data): Single-trial behavioral and neural data
* Who (generated this documentation): Hause Lin
* Who (collected the data): Akina Umemoto

## Additional information

* Contact: akumemoto@gmail.com

## Columns

* Rows: 19968
* Columns: 46

| Column                           | Type     | Description                                                        |
| -------------------------------- | -------- | ------------------------------------------------------------------ |
| subject                          | numeric  | subject id                                                         |
| trial                            | numeric  | trial number                                                       |
| block                            | numeric  | block number                                                       |
| offerProbability                 | numeric  | offer probability                                                  |
| offerReward                      | numeric  | offer reward                                                       |
| choice                           | numeric  | choice/chosen option (0: baseline; 1: high-effort)                 |
| chosenReward                     | numeric  | chosen option reward                                               |
| outcomeReward                    | numeric  | outcome reward (shown at feedback) (-0.5: no reward)               |
| rt                               | numeric  | reaction time ()                                                   |
| gripSuccess                      | numeric  | 0: failed handgrip; 1: passed handgrip                             |
| keyPress                         | numeric  |                                                                    |
| rewp_Fz                          | numeric  | RewP at Fz channel                                                 |
| rewp_FCz                         | numeric  | RewP at FCz channel                                                |
| rewp_Cz                          | numeric  | RewP at Cz channel                                                 |
| rewp_CPz                         | numeric  | RewP at CPz channel                                                |
| rewp_Pz                          | numeric  | RewP at Pz channel                                                 |
| CPz_p3                           | numeric  | P3 at CPz channel                                                  |
| Pz_p3                            | numeric  | P3 at Pz channel                                                   |
| fcz_choice_theta_win2            | numeric  | phasic theta                                                       |
| fcz_choice_theta_baseline_win2   | numeric  |                                                                    |
| fcz_choice_theta_win1            | numeric  |                                                                    |
| fcz_choice_theta_baseline_win1   | numeric  |                                                                    |
| fcz_choice_theta_entire4sChoice  | numeric  | tonic theta                                                        |
| rr                               | numeric  | personality measure                                                |
| tepsc                            | numeric  | personality measure                                                |
| tepsa                            | numeric  | personality measure                                                |
| per                              | numeric  | personality measure                                                |
| apathy                           | numeric  | personality measure                                                |
| rumi                             | numeric  | personality measure                                                |
| dep                              | numeric  | personality measure                                                |
| anx                              | numeric  | personality measure                                                |
| stress                           | numeric  | personality measure                                                |
| EVdiff                           | numeric  | difference in expected value between two options                   |
| outcomeRewardBinary              | numeric  | outcome reward (shown at feedback) (-0.5: no reward; 0.5: reward)  |
| offerEV                          | numeric  | epected value of high-effort option                                |
| choiceC                          | numeric  | choice/chosen option centered                                      |
| gripSuccessC                     | numeric  | gripSuccess centered                                               |
| fcz_choice_theta_win1_bc         | numeric  |                                                                    |
| fcz_choice_theta_win2_bc         | numeric  | phasic theta baseline corrected                                    |
| ev_hard                          | numeric  | expected value EV of hard option                                   |
| ev_easy                          | numeric  | expected value EV of easy option                                   |
| ev_diff                          | numeric  | EV hard minus EV easy                                              |
| sv_diff                          | numeric  | subjective value difference                                        |
| indiff                           | numeric  | indiference point                                                  |
| ev_diffC                         | numeric  | ev_diff subject-mean-centered                                      |
| sv_diffC                         | numeric  | sv_diff subject-mean-centered                                      |

End of documentation.


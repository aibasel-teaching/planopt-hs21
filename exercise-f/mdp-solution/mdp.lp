Minimize
    obj: ExpReward0
Subject To
    s0a0: ExpReward0 - 0.9 ExpReward1 >= 0
    s0a0: ExpReward1 - 0.3 ExpReward0 - 0.6 ExpReward2 >= 0
    s0a1: ExpReward1 - 0.6 ExpReward0 - 0.3 ExpReward2 >= 1
    s2a0: ExpReward2 - 0.3 ExpReward3 - 0.6 ExpReward0 >= 0
    s0a2: ExpReward2 - 0.9 ExpReward0 >= 5
    s3a3: ExpReward3 - 0.9 ExpReward0 >= 10
End

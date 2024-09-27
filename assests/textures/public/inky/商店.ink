VAR output = ""
VAR act = 0
VAR def = 0
VAR y_key = 0
VAR b_key = 0
VAR r_key = 0
VAR kane = 0
VAR delete = true
VAR stop = true


-> STAR
=== STAR
只能购买一次
你需要点什么#other #莱卡恩.png
+ [获得10$]
~ kane += 10
获得10$
-> END
+ [黄钥匙免费*1]
获得黄钥匙*1
~ y_key++
-> END
+ [蓝钥匙10$]
{kane<10:
~ output = "$"
-> RE
- else:

获得蓝钥匙*1
~kane-=10
~ b_key++
-> END
}
+ [红钥匙20$]
{kane<20:
~ output = "$"
-> RE
- else:
获得红钥匙*1
~kane-=20
~ r_key++
-> END
}
+ [3黄换1蓝钥匙]
{y_key<3:
~ output = "黄钥匙"
-> RE
- else:
获得蓝钥匙*1
~y_key-=3
~ b_key++
-> END
}
+ [2蓝换1红钥匙]
{b_key<2:
~ output = "蓝钥匙"
-> RE
- else:
获得红钥匙*1
~b_key-=2
~ r_key++
-> END
}
+ [1黄钥匙换10攻击力]
{y_key<1:
~ output = "黄钥匙"
-> RE
- else:
获得10攻击力
~y_key-=1
~ act += 10
-> END
}
+ [1黄钥匙换10防御力]
{y_key<1:
~ output = "黄钥匙"
-> RE
- else:
获得10防御力
~y_key-=1
~ def += 10
-> END
}

=== RE
{output}不够 #player #苍角.png
-> STAR
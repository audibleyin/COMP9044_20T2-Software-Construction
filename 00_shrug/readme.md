## 初级版本
｜---当前工作目录
    ｜---.shrug
        ｜---shrug-branch.txt       -- 记录版本的的信息
        ｜---shrug-commit.log       -- 每次提交记录的版本号
            -- 文件的文件内容
            0       ‘modify a.txt’
            1       'add b.txt'
            2       'modify a.txt and b.txt'
        ｜---index
        ｜---branch
            ｜---a.txt              -- 当前仓库的版本
            ｜---b.txt              -- 当前仓库的版本
            ｜---0                  -- 提交的历史版本号：第0次提交
                ｜---a.txt          -- 当前版本号下只提交了a.txt
            ｜---1                  -- 提交的历史版本号：第1次提交
                ｜---b.txt          -- 当前版本号下只提交了b.txt
            ｜---2                  -- 提交的历史版本号：第2次提交
                ｜---a.txt          -- 当前版本号下只提交了a.txt 
                ｜---b.txt          -- 当前版本号下只提交了b.txt  
    ---a.txt
    ---b.txt

### subset0
    shrug-init
        创建index
        创建branch
        创建shrug-commit.log 
        创建shrug-branch.txt
    shrug-add
        把当前的添加到index
    shrug-commit
        1.把index的文件cp到branch，同时有一个编号
        2.写入一个日志
    shrug-log
        显示的是shrug-commit.log 文件内容
    
    shrug-show [commit]:filename
        显示commit-number对应filename的文件内容
        shrug-show 0:a.txt
    
    把subseet0写完+日志，多写点注释 --75分

### subset1
    shrug-commit [-a] -m message
        在index里面存在，文件名相同的当前工作目录下的文件，都复制一份到index目录下，再执行commit操作
        index/a.txt


        a.txt

    shrug-rm [--force] [--cached] filenames
        shrug-rm a.txt
            在当前的工作目录，和index的目录下删除 a.txt

        shrug-rm [--force] a.txt
            当当前的工作目录下的a.txt 与index的目录下的a.txt不一致的时候，--force 起作用，强制删除
        
        shrug-rm --cached a.txt
            只删除index的目录下的a.txt

        shrug-rm [--force] [--cached] a.txt
            当当前的工作目录下的a.txt 与index的目录下的a.txt不一致的时候，--force 起作用，强制删除index中的a.txt


    shrug-status
        显示当前工作目录下，index, repo/branch三个工作目录下，文件状态的对比

        当前工作目录下，index, repo/branch
            对于一个文件来说
                保持不变
                新增内容/修改内容
                删除文件

        untracked                   --  在index里面没有
        same as repo                -- 都一样
        changes staged              -- 当前目录下的a.txt与index/a.txt相同，与repo/a.txt不同
        changes not staged          -- 三个都不同
        different changes staged    -- 当前目录下的a.txt与index/a.txt 不相同，index/a.txt 与repo/a.txt 相同

        file deleted                -- 当前目录不存在 ，index存在
        deleted                     -- 当前目录不存在，index 不存在，repo 存在

## 高级版本
｜---当前工作目录
    ｜---.shrug
        ｜---current-branch.txt       -- 记录版本的的信息
            branch01
        ｜---shrug-branch.txt       -- 记录版本的的信息
            -- 文件的文件内容
            master              -- * 表示当前的版本分支
            branch01
            branch02

        ｜---shrug-commit.log
            -- 文件的文件内容
            0 master        'add a.txt'
            1 master        'add b.txt'
            2 master        'modify a.txt, b.txt'
            3 branch01      'add a.txt'
            4 branch01      'modify a.txt'
            5 branch01      'add b.txt'
            6 branch02      'modify b.txt'
        ｜---index
        ｜---branches
            ｜---master
                ｜---a.txt              -- 当前当前分支的文件
                ｜---b.txt              -- 当前当前分支的文件
                ｜---0                  -- 提交的历史版本号：第0次提交
                    ｜---a.txt          -- 当前版本号下只提交了a.txt
                ｜---1                  -- 提交的历史版本号：第1次提交
                    ｜---a.txt          -- 当前版本号下存在a.txt
                    ｜---b.txt          -- 当前版本号下只提交了b.txt
                ｜---2                  -- 提交的历史版本号：第2次提交
                    ｜---a.txt          -- 当前版本号下修改了a.txt 
                    ｜---b.txt          -- 当前版本号下修改了b.txt 
            ｜---branch01
                ｜---a.txt              -- 当前当前分支的文件
                ｜---3                  -- 提交的历史版本号：第3次提交
                    ｜---a.txt          -- 当前版本号下只提交了a.txt
                ｜---4                  -- 提交的历史版本号：第4次提交
                    ｜---a.txt          -- 当前版本号下只提交了a.txt
            ｜---branch02
                ｜---b.txt              -- 当前当前分支的文件
                ｜---5                  -- 提交的历史版本号：第3次提交
                    ｜---b.txt          -- 当前版本号下只提交了b.txt
                ｜---6                  -- 提交的历史版本号：第4次提交
                    ｜---b.txt          -- 当前版本号下只提交了b.txt
    ---a.txt
    ---b.txt


### subset2

    shrug-branch [-d] [branch-name]
        shrug-branch
            列出所有的branch

        shrug-branch branch01
            创建branch01文件内容
            把当前的branch所在的最后一次提交的commit-number复制一份
            更新shrug-branch.txt
        
        shrug-branch -d branch01
            删除branch01文件内容
            更新shrug-branch.txt

    shrug-checkout branch-name
        shrug-checkout switches branches.
        shrug-checkout branch01

        判断当前目录下，与branch01下面的文件，两个文件夹下的文件都存在，并且不一致，保留当前的目录下的文件
        判断当前目录下，与branch01下面的文件，两个文件夹下的文件都存在，并且一致，忽略
        branch01下面的文件存在，但是当前文件目录下不存在，从branch01里面复制出来

        
    shrug-merge branch-name|commit -m message
            
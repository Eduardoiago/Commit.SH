# Commit.SH 
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)

Shell script to optimize project commits. Using the script automatically you use `git add .`, `git commit -m` and `git push -u origin main`. The main branch is the default. If you are committing to another branch, you should change the branch name.

### Adding execute permission to the script

``` bash
    chmod +x commit.sh
```

### Creating alias for the script

- After downloading, move the script to `/opt`
- Enter the `.bashrc` file and add the alias below:

``` bash
    alias commit='bash /opt/commit.sh'
```

## Usage

``` bash
    commit -h
```

<img src="/assets/commit-H.png" alt="commit.sh-h"> 

``` bash
    commit -m "your commit"
```

<img src="/assets/commit-M.png" alt="commit.sh-m"> 

## License
 * [MIT](LICENSE)
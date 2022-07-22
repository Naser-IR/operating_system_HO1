//Naser Rabah 207811282
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <limits.h>

// use path for file you could get to run if you get any argument
int main(int argc, char**argv ) {
    // to add path if exist
        char * update;
        char * update2;
        int i=1;
        for (; i<argc; i++) {
            update = getenv("PATH");
            update2 = malloc(strlen(update)+strlen(argv[i]) +2);
            unsigned z = strlen(argv[i]);
            int j = 0;
            for (; j < strlen(argv[i]) ; ++j) {
                update2[j]=argv[i][j];
            }
            update2[z]=  ':';
            z++;
            int j1=0 ;
            for ( ; j1 < strlen(update); ++j1) {
                update2[z]= update[j1];
                z++;
            }
            setenv("PATH",update2,1);
            free(update2);
        }
        // save the starting path
        char update3[PATH_MAX];
        getcwd(update3, sizeof(update3));
        char s[100];
        char cur[100];
        int id[100];
        char *z[100];
        char *storage[100];
        const char g[2] = " ";
        char *token;
        pid_t pid;
        int l;
        int w = 0;
        int j = 0;
    for (; j < 100 ; ++j) {
        printf("$ ");
        fflush(stdout);
        int i = 0;
        scanf(" %[^\n]s", s);//to take input till the user click enter
        int stat;
        strcpy(cur,s);
        /* get the first token */
        token = strtok(s, g);
        /* walk through other tokens */
        while (token != NULL) {
            z[i] = malloc(100);
            strcpy(z[i],token);
            i++;
            token = strtok(NULL, g);
        }
        z[i] = NULL;
        //strcmp in if statement
        if (strcmp(z[0],"exit")  == 0) {
            chdir(update3);
            int n = 0;
            for (; n < w; ++n) {
                free(storage[n]);
            }
            return 0;
        } else if(strcmp(z[0],"cd")  == 0){
            id[w] =getpid();
            storage[w] = malloc(100);
            strcpy(storage[w],cur);
            w++;
            l = chdir(z[1]);
            if (l == -1){
                perror("cd failed");
            }
        } else if(strcmp(z[0],"history")  == 0){
            id[w] =getpid();
            storage[w] = malloc(100);
            strcpy(storage[w],cur);
            w++;
            int k = 0;
            for (; k < w; ++k) {
                printf("%d ",id[k]);
                printf("%s \n",storage[k]);
            }
        }else {

            pid = fork();
            if (pid == 0) {
              l = execvp(z[0], z);
                if (l == -1) {
                    perror("execvp failed");
                    printf("\n");
                exit(0);}
            } else {
                //wait(&stat);
                if (wait(&stat) == -1)
                    perror("Wait failed");
                if (pid == -1)
                    perror("fork failed");
                int k = 0;
                for (; k < i; ++k) {
                    free(z[k]);
                }
                id[w] =pid;
                storage[w] = malloc(120);
                strcpy(storage[w],cur);
                w++;
            }
        }
        //return 0;
    }
    chdir(update3);
}

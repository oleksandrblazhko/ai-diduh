#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(void) {
    pid_t pid = fork();
    if (pid != 0) {

        // Батьківський
        printf("I'm parent with PPID  %d. My child pid is  %d\n", getpid(), pid);
        sleep(2);
        _exit(0);
    } else {

        // Дчірній
        for (int i = 0; i < 3; i++) {
            printf("\nI'm child with pid %d\nParent of Didukh  PPID is  %d\n--------------\n", getpid(), getppid());
            sleep(1);
        }
    }
    return 0;
}

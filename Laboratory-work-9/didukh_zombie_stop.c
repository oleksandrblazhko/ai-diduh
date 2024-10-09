#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>

void sig_catcher(int sig) {
    printf("Signal catcher for %d\n", sig);
    wait(0);
}

int main(void) {
    signal(SIGCHLD, &sig_catcher);

    pid_t pid = fork();
    if (pid == 0) {
        fprintf(stdout, "\n---------------\nChild of Didukh is finished!\n---------------\n");
        _exit(0);
    } else {

        fprintf(stdout, "Parent START ....\n");
        sleep(3);
        fprintf(stdout, "Parent FINISH ....\n");
    }

    return EXIT_SUCCESS;
}

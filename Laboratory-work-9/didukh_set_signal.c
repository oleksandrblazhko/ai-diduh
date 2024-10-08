#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>





int main(int argc, char *argv[]) {
    pid_t pid;

    if (argc == 1) {
        fprintf(stderr, "Usage: %s <pid>\n", argv[0]);
        return EXIT_FAILURE;
    }

    pid = (pid_t) atoi(argv[1]);

    if (!kill(pid, SIGUSR2)) {
        printf("Send Signal to Process with PID %d!\n", pid);
    } else {
        fprintf(stderr, "Error sending signal to PID %d\n", pid);
    }

    return EXIT_SUCCESS;
}

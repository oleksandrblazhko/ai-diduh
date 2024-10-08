#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

static void sig_usr(int sig_nal) {
    if (sig_nal == SIGUSR2)
        printf("get signal SIGUSR2\n");
}

int main(void) {
    if (signal(SIGUSR2, sig_usr) == SIG_ERR)
        fprintf(stderr, "Can't catch SIGUSR2\n");

    printf("My PID = %d. Waiting for SIGUSR2 signal\n", getpid());
    
    for (;;) {
        pause(); // оічікування сигнула
    }

    return EXIT_SUCCESS;
}

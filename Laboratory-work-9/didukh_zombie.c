#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>



int main(void) {
    pid_t pid = fork();
    if (pid == 0) {

        fprintf(stderr, "---------------\nI am Zombie-process of Didukh\n---------------\n");
        _exit (0);
    } else {

        fprintf(stderr, "Start of parent process...\n");
        sleep (10);
        fprintf(stderr, "Finish of parent process...\n");
    }
    return EXIT_SUCCESS;
}

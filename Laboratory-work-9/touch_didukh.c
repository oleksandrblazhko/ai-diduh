#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        // доччірній процес
        printf("The child of Didukh executes: ls -l -a\n");

        //Пауза
        sleep(2);

        // execv
        char *args[] = {"/bin/ls", "-l", "-a", NULL};

        // Виконання "ls -l -a"
        execv(args[0], args);
    }

    return 0;
}

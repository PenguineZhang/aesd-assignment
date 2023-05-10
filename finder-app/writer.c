#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <sys/stat.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char* argv[])
{
    openlog(NULL, LOG_CONS, LOG_USER);
    
    if( argc < 3 ){
        printf("Must be executed with ./writer <file path> <string>\n");
        syslog(LOG_ERR, "%s", "Must be executed with ./writer <file path> <string>");
        closelog();
        exit(1);
    }

    char* file = argv[1];
    char* str = argv[2];

    int fd = open(file, O_RDWR | O_CREAT, S_IRWXU);

    char buf[1024];
    int char_cnt = sprintf(buf, "Writing %s to %s\n", str, file);
    ssize_t write_size = write(fd, buf, char_cnt);
    if(write_size < 0){
        syslog(LOG_ERR, "%s", "Failed to write into file\n");
    }
    syslog(LOG_DEBUG, "%s", buf);

    closelog();
    close(fd);
    return 0;
}
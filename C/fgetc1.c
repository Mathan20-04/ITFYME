#include<stdio.h>
int main() {
    char str[128];
    char line[128];
    int cnt=0;
    printf("Enter the name of the file to read from : \n");
    scanf("%s",&str);
    FILE * fp; //declare a file pointer
    fp=fopen(str,"r");
    if(fp!=NULL) {
        printf("opened file named %s \n",str);
        while(!feof(fp)) {
            fscanf(fp,"%[^\n]\n",line);
            printf("%s\n",line);
            printf("%c",fgetc(fp));
            cnt++;
        }
        printf("looped %d times",cnt);
        fclose(fp);
    }else{
        printf("Unable to open the file %s \n",str);
    }
}

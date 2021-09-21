extern void my_print(char *, int);
void print(char* str)
{
    int len = 0;
    while(str[len++]);
    my_print(str, len);
}

int main()
{
    return 0;
}
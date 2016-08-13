#define HASH_SIZE 997

//returns -1 if hash not initialized
int add(char* text, int token);
//returns -1 if hash not initialized
//and -2 if no record could be found
int get(char* text);
void init();

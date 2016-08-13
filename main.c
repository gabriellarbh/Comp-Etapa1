#include "hash.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
  init();
  add("oi",15);
  add("oi2",16);
  printf("%d", get("oi"));
}
